package com.example.rss_client;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.provider.OpenableColumns;
import android.util.Log;
import android.webkit.MimeTypeMap;
import android.widget.Button;
import android.widget.Toast;
import com.example.rss_client.Client.DamageLocationOrBuilder;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

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

    // Create a Cloud Storage reference from the app
    StorageReference rssStorageRef = FirebaseStorage.getInstance().getReference("uploads");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        selectBtn = findViewById(R.id.imgSelect);
        uploadBtn = findViewById(R.id.imgUpload);
        uploadBtn.setEnabled(imageList.isEmpty());// Enable upload button if the list isn't empty

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
                    Log.i("Uri data", "onActivityResult: " + uri.toString());

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

            if (ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {// If permission is denied
                ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE},1);
//                return;
            }

            Intent intent = new Intent(Intent.ACTION_GET_CONTENT);//, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
            intent.setType("image/*");
            intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
            startIntentActivityResultLauncher.launch(intent);
//            Intent intent = new Intent(Intent.ACTION_GET_CONTENT, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
//            intent.setType("image/*");
//            intent.putExtra(Intent.ACTION_PICK, 1);
//            intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
//            startIntentActivityResultLauncher.launch(Intent.createChooser(intent, "Select item(s)"));
        });

        uploadBtn.setOnClickListener(v -> {
            uploadImg();
        });
    }

    // Get File Extension from Uri
    //TODO: Requires research
    private String getFileExt(Uri uri) {
        MimeTypeMap mimeTypeMap = MimeTypeMap.getSingleton();
        return mimeTypeMap.getExtensionFromMimeType(getContentResolver().getType(uri));
    }

    private void uploadImg() {
        assert !imageList.isEmpty();
        for (Uri uri : imageList
        ) {
            Log.i("Uri", String.valueOf(getFileName(uri).hashCode()));

            StorageReference storageReference = rssStorageRef.child(System.currentTimeMillis() + '.' + getFileExt(uri));

            storageReference.putFile(uri).addOnSuccessListener(taskSnapshot -> {
                Toast.makeText(this, "Upload Successful", Toast.LENGTH_SHORT).show();
                Log.i("Firebase Storage", storageReference.getPath());
                Log.i("Firebase Storage", "uploadImg: image has been uploaded to firebase");
                // TODO: Impl progress bar
            }).addOnFailureListener(e -> {
                Toast.makeText(this, "Upload failed. Please try again later", Toast.LENGTH_SHORT).show();
                Log.e("Firebase Storage", e.getMessage());
            }).addOnProgressListener(snapshot -> {
                double progress = (100.0 * snapshot.getBytesTransferred() / snapshot.getTotalByteCount());
                // TODO: Complete with progress bar
            });
        }
        // TODO: Hash image name instead of usign currentTimeMills()
        // TODO: Check for duplicates using hashed name
        // TODO: Impl protobuf to application
        // TODO: create bucket depending on user email/Id (Use Email as ID)
        // TODO: Assign full path to blobURL of proto schema attribute
    }

    private String getFileName(Uri uri) {
//        Uri returnUri = returnIntent.getData();
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