package com.example.rss_client;

import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.util.Log;
import android.webkit.MimeTypeMap;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    /**
     * Resource: https://youtu.be/2eQC8NuaMkw
     * https://youtu.be/lPfQN-Sfnjw?list=PLrnPJCHvNZuB_7nB5QD-4bNg6tpdEUImQ
     */
    Button selectBtn, uploadBtn;
    ArrayList<Uri> imageList = new ArrayList<Uri>();
    ArrayList<BlobSrc.Builder> blobsList = new ArrayList<BlobSrc.Builder>();

    // Create a Cloud Storage reference from the app
    StorageReference rssStorageRef = FirebaseStorage.getInstance().getReference("uploads");
    RSSKafkaClient rssKafkaClient;
    private Client.Builder rssClient;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        selectBtn = findViewById(R.id.imgSelect);
        uploadBtn = findViewById(R.id.imgUpload);
        uploadBtn.setEnabled(imageList.isEmpty());// Enable upload button if the list isn't empty

//        rssKafkaClient = new RSSKafkaClient(); // Inits Kafka Producer with config properties
//        rssClient = Client.newBuilder();


        ActivityResultLauncher<Intent> startIntentActivityResultLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback<ActivityResult>() {
            // Resource: https://youtu.be/Ke9PaRdMcgc
            @Override
            public void onActivityResult(ActivityResult result) {
                if (result.getResultCode() == RESULT_OK) {
                    Log.i("Result code", String.valueOf(result.getResultCode()));
                    assert result.getData() != null;
                    int currImg = 0, totalImgSelected = 0;
                    Uri imgUri;

                    Uri uri = result.getData().getData();
//                    Log.i("Uri data", "onActivityResult: " + uri.getUserInfo());

                    if ((result.getData().getClipData() != null)) {

                        totalImgSelected = result.getData().getClipData().getItemCount();

                        while (currImg < totalImgSelected) {
//                        imgUri= result.getData().getData();

                            imgUri = result.getData().getClipData().getItemAt(currImg).getUri();
//                        Log.i("Img name",result.getData().getClipData().getItemAt(currImg).getText().toString()) ;
                            imageList.add(imgUri);
                            currImg++;
                            Log.i("Image Intent: ", imgUri.toString());
                        }

                    } else {
                        // Only 1 item was selected
                        imgUri = result.getData().getData();
                        imageList.add(imgUri);
                        totalImgSelected++;
                        Log.i("Image Intent: ", imgUri.toString());
                    }
                    Toast.makeText(MainActivity.this, totalImgSelected + " image(s) has been selected", Toast.LENGTH_SHORT).show();
                }

            }
        });

        selectBtn.setOnClickListener(v -> {
            imageList.clear(); // clears the list so it can be populated

            Intent intent = new Intent(Intent.ACTION_GET_CONTENT);//, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
            intent.setType("image/*");
            intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
            startIntentActivityResultLauncher.launch(intent);
        });

        uploadBtn.setOnClickListener(v -> {
            buildClient();
            streamResults();
        });
    }

    /*
     * Builds the client from local storage/Shared Preferences
     * TODO: Impl shared prefs to populate user data
     * TODO: Impl UI to collect user data and save to shared prefs */
    private void buildClient() {
        rssClient = Client.newBuilder().setEmail("example@example.com").setId(123456).setName("Slim Shady");
    }

    /**
     * Returns the the populated BlobMetaData
     * <p>
     *
     * @param uri
     * @return the populated BlobMetadata
     */
    private BlobSrc buildBlobMetadata(Uri uri, String blobURL, BlobSrc.BlobTypeCase blobTypeCase) {
        BlobSrc.Builder blobSrc = BlobSrc.newBuilder();//.setImage("image");
        blobSrc.setBlobUrl(blobURL); // Sets the BlobURL

        switch (blobTypeCase) { // Sets the blob type
            case IMAGE:
                blobSrc.setImage("image");
                Log.i("Blob Type", "buildClient: Image");
            case VIDEO:
                blobSrc.setImage("image");
                Log.i("Blob Type", "buildClient: Video");
        }

        // Extracts DateTime from Uri
//        ExifInterface exif = null;
//        try {
//            exif = new ExifInterface(uri.getEncodedPath());
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

//        String date = exif.getAttribute(ExifInterface.TAG_DATETIME);
//
//        try {
//            blobSrc.setDatetimeCreated(DateTime.parseFrom(ByteString.fromHex(date)));
//        } catch (InvalidProtocolBufferException e) {
//            e.printStackTrace();
//        }

        if (blobSrc.isInitialized()) {
            blobSrc.getInitializationErrorString();
            Log.d("Blob Data", "Blob has not been completely initialized: ");
        }
        Log.i("Blob Data", blobSrc.toString());

        return blobSrc.build();
    }

    /*
     * Uploads RSS Client event to Kafka Broker */
    private void uploadRssClient() {
        if (rssClient.getBlobsCount() >0) {

            Log.i("Blob Count", String.valueOf(rssClient.getBlobsCount()));
            // Send each blob item to Kafka broker as event
            rssKafkaClient.send(rssClient); //TODO: Complete kafka integration
        }
    }


    /*
     * uploads the image(s) to Firebase Storage */
    private void streamResults() {
        assert !imageList.isEmpty(); // Check if image list is empty before attempting to upload to Firebase Storage
        for (Uri uri : imageList
        ) {
            Log.i("Uri", String.valueOf(getFileName(uri).hashCode()));

            StorageReference storageReference = rssStorageRef.child(System.currentTimeMillis() + '.' + getFileExt(uri));
            BlobSrc.Builder blobSrc = BlobSrc.newBuilder((buildBlobMetadata(uri, storageReference.getDownloadUrl().toString(), BlobSrc.BlobTypeCase.IMAGE)));
            storageReference.putFile(uri).addOnSuccessListener(taskSnapshot -> {
                Toast.makeText(this, "Upload Successful", Toast.LENGTH_SHORT).show();
                Log.i("Firebase Storage", "uploadImg: image has been uploaded to firebase at " + storageReference.getPath());


                // TODO: Impl progress bar
            }).addOnFailureListener(e -> {
                Toast.makeText(this, "Upload failed. Please try again later", Toast.LENGTH_SHORT).show();
                Log.e("Firebase Storage", e.getMessage());
            }).addOnProgressListener(snapshot -> {
                double progress = (100.0 * snapshot.getBytesTransferred() / snapshot.getTotalByteCount());
                // TODO: Complete with progress bar
            });

            // Add BlobSrc to rssClient
            rssClient.addBlobs(blobSrc);}

        uploadRssClient(); // uploads the rssClient to Kafka Broker


        // TODO: Hash image name instead of usign currentTimeMills()
        // TODO: Check for duplicates using hashed name
        // TODO: create bucket depending on user email/Id (Use Email as ID)
    }

    // Get File Extension from Uri
    private String getFileExt(Uri uri) {
        // TODO: Requires more research
        MimeTypeMap mimeTypeMap = MimeTypeMap.getSingleton();
        return mimeTypeMap.getExtensionFromMimeType(getContentResolver().getType(uri));
    }

    /*
     * Obtains file name from provided Uri */
    @Nullable
    private String getFileName(Uri uri) {
        Cursor returnCursor =
                getContentResolver().query(uri, null, null, null, null);
        /*
         * Get the column indexes of the data in the Cursor,
         * move to the first row in the Cursor, get the data,
         * and display it.
         */
        if (returnCursor != null && returnCursor.moveToFirst()) {
            int nameIndex = returnCursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
            return returnCursor.getString(nameIndex);
        }
        return null;
    }
}