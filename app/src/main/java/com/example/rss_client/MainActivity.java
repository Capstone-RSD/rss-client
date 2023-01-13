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

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.HttpHeaderParser;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.util.JsonFormat;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    /**
     * Resource: https://youtu.be/2eQC8NuaMkw
     * https://youtu.be/lPfQN-Sfnjw?list=PLrnPJCHvNZuB_7nB5QD-4bNg6tpdEUImQ
     */
    Button selectBtn, uploadBtn;
    ArrayList<Uri> imageList = new ArrayList<Uri>();
    ArrayList<BlobSrc.Builder> blobsList = new ArrayList<BlobSrc.Builder>();

    private static final String URL = "https://pkc-3w22w.us-central1.gcp.confluent.cloud:443/kafka/v3/clusters";
    private Client.Builder rssClient;
    private static final String TOPIC = "/rss_topic";
    private static final String CLUSTER_ID = "/lkc-d91ond";
    private static final Integer SCHEMA_ID = 100001;
    private static final String API_KEY = BuildConfig.RSS_API_KEY;
    // Create a Cloud Storage reference from the app
    StorageReference rssStorageRef = FirebaseStorage.getInstance().getReference();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        selectBtn = findViewById(R.id.imgSelect);
        uploadBtn = findViewById(R.id.imgUpload);
//        uploadBtn.setEnabled(!imageList.isEmpty());// Enable upload button if the list isn't empty


        String tempURL = URL + CLUSTER_ID + "/topics";

        Log.d("url", tempURL.toString());
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.GET, tempURL, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Log.d("Volley REST Response", response.toString());
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("Volley REST Response error", error.toString());
                Toast.makeText(MainActivity.this, error.getMessage(), Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap headers = new HashMap();
                headers.put("Content-Type", "application/json");
                headers.put("Authorization", "Basic " + API_KEY);

                Log.d("headers", headers.toString());
                return headers;

            }
        };

        RequestQueue resquestQueue = Volley.newRequestQueue(getApplicationContext());
        resquestQueue.add(stringRequest);

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
            uploadRssClient(); // uploads the rssClient to Kafka Broker

        });
    }

    /**
     * Builds the client from local storage/Shared Preferences
     */
    private void buildClient() {
        // TODO: Impl shared prefs to populate user data
        // TODO: Impl UI to collect user data and save to shared prefs
        // TODO: impl random ID for user. Firebase bucket depends on this to be unique
        rssClient = Client.newBuilder().setEmail("example@example.com").setId(123456).setName("Slim Shady");
    }

    /**
     * Returns the the populated BlobMetaData
     * <p>
     *
     * @param uri
     * @param blobURL
     * @param blobTypeCase
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

        // TODO: Collect datetime from image/Uri and populate rssClient datetime attributes
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

    /**
     * Uploads RSS Client event to Kafka Broker
     */
    private void uploadRssClient() {
        if (rssClient.getBlobsCount() > 0) {

            Log.i("Blob Count", String.valueOf(rssClient.getBlobsCount()));

            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        //Your code goes here
                        sendPost();
                    } catch (Exception e) {
                        Log.e("okhttp", e.getMessage());
                    }
                }
            });
            thread.start();
        } else {
            Log.i("Blob Count", "Is empty");
        }
    }

    /**
     * Sends the rssClient data to the Kafka Broker in a post request
     */
    private void sendPost() {
        String postUrl = URL + CLUSTER_ID + "/topics" + TOPIC + "/records";
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.POST, postUrl, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Log.d("Volley REST Response", response.toString());
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("Volley REST Response error", "onCreate: " + error.networkResponse.toString());
                Toast.makeText(MainActivity.this, "There was an error. Please try again", Toast.LENGTH_SHORT).show();
            }
        }) {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap headers = new HashMap();
                headers.put("Content-Type", "application/json");
                headers.put("Authorization", "Basic " + API_KEY);

                Log.d("headers", headers.toString());
                return headers;
            }

            @Override
            public byte[] getBody() {
                JSONObject body = new JSONObject();
                JSONObject key = new JSONObject();
                JSONObject value = new JSONObject();
                try {
                    key.put("subject_name_strategy", TOPIC.toUpperCase());
                    key.put("schema_id", JSONObject.NULL);
                    key.put("data", JSONObject.NULL);

                    String rssClient_json = JsonFormat.printer().print(rssClient);
                    JSONObject json = new JSONObject(rssClient_json);

                    value.put("type", "JSON");
                    value.put("data", json);

                    Log.d("key", key.toString());
                    Log.d("value", value.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                } catch (InvalidProtocolBufferException e) {
                    e.printStackTrace();
                }
                try {
                    body.put("key", JSONObject.NULL);
                    body.put("value", value);
                    Log.d("Body", body.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                return body.toString().getBytes(StandardCharsets.UTF_8);
            }

            @Override
            protected Response parseNetworkResponse(NetworkResponse response) {
                try {
                    Log.i("Kafka rest proxy", "response data " + response.data);
                    String jsonString = new String(response.data, HttpHeaderParser.parseCharset(response.headers));
                    return Response.success(new JSONObject(jsonString), HttpHeaderParser.parseCacheHeaders(response));
                } catch (UnsupportedEncodingException | JSONException e) {
                    return Response.error(new ParseError(e));
                }
            }

        };
        Log.d("Kafka Proxy URL", stringRequest.getUrl());
        RequestQueue resquestQueue = Volley.newRequestQueue(MainActivity.this);
        resquestQueue.add(stringRequest);

    }

    /*
     * uploads the image(s) to Firebase Storage */
    private void streamResults() {
        assert !imageList.isEmpty(); // Check if image list is empty before attempting to upload to Firebase Storage
        for (Uri uri : imageList
        ) {
            Log.i("Uri", String.valueOf(getFileName(uri).hashCode()));

            StorageReference storageReference = rssStorageRef.child(rssClient.getId()+"/"+System.currentTimeMillis() + '.' + getFileExt(uri));
            BlobSrc.Builder blobSrc = BlobSrc.newBuilder((buildBlobMetadata(uri, storageReference.getDownloadUrl().toString(), BlobSrc.BlobTypeCase.IMAGE)));
            storageReference.putFile(uri).addOnSuccessListener(taskSnapshot -> {
                Toast.makeText(this, "Upload Successful", Toast.LENGTH_SHORT).show();
                Log.i("Firebase Storage", "uploadImg: image has been uploaded to firebase at " + storageReference.getPath());


                // TODO: Impl on success progress bar
            }).addOnFailureListener(e -> {
                Toast.makeText(this, "Upload failed. Please try again later", Toast.LENGTH_SHORT).show();
                Log.e("Firebase Storage", e.getMessage());
            }).addOnProgressListener(snapshot -> {
                double progress = (100.0 * snapshot.getBytesTransferred() / snapshot.getTotalByteCount());
                // TODO: Complete with progress bar
            });

            // Add BlobSrc to rssClient
            rssClient.addBlobs(blobSrc);
        }

        // TODO: Hash image name instead of usign currentTimeMills()
        // TODO: Check for duplicates using hashed name
        // TODO: create firebase bucket depending on user email/Id (Use Email as ID)
    }

    // Get File Extension from Uri
    private String getFileExt(Uri uri) {
        // TODO: Requires more research
        MimeTypeMap mimeTypeMap = MimeTypeMap.getSingleton();
        return mimeTypeMap.getExtensionFromMimeType(getContentResolver().getType(uri));
    }

    /**
     * Obtains file name from provided Uri
     */
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