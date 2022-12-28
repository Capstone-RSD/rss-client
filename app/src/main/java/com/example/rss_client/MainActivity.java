package com.example.rss_client;

import android.Manifest;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    // Resource: https://youtu.be/2eQC8NuaMkw
    Button selectBtn, uploadBtn;
    ArrayList<Uri> imageList = new ArrayList<Uri>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        selectBtn = findViewById(R.id.imgSelect);
        uploadBtn = findViewById(R.id.imgUpload);

        ActivityResultLauncher<Intent> startIntentActivityResultLauncher = getIntentActivityResultLauncher();

        selectBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) { // Have we granted permission
                    Toast.makeText(MainActivity.this,"Permission has been granted",Toast.LENGTH_SHORT).show();}
                else if(ActivityCompat.shouldShowRequestPermissionRationale(MainActivity.this,Manifest.permission.READ_EXTERNAL_STORAGE)){
                    new AlertDialog.Builder(MainActivity.this).setTitle("Permission needed").setMessage("This mpermission is needed for RSS").setPositiveButton("OK", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, 100);
                        }
                    }).setNegativeButton("Cancal", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    }).create().show();
                }
                   else {
                    ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, 100);
                }

//            Intent intent = new Intent(Intent.ACTION_GET_CONTENT);//, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
//            intent.setType("image/*");
//            intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE,true);
//            startIntentActivityResultLauncher.launch(intent);
                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);//, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                intent.setType("image/*");
//            intent.putExtra(Intent.ACTION_PICK, 1);
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
                startIntentActivityResultLauncher.launch(Intent.createChooser(intent, "Select item(s)"));
            }

        });

    }

    @NonNull
    private ActivityResultLauncher<Intent> getIntentActivityResultLauncher() {
        ActivityResultLauncher<Intent> startIntentActivityResultLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback<ActivityResult>() {
            // Resource: https://youtu.be/Ke9PaRdMcgc
            @Override
            public void onActivityResult(ActivityResult result) {
                if (result.getResultCode() == RESULT_OK) {
                    assert result.getData() != null;
                    assert (result.getData().getClipData() != null);
                    int currImg = 0;
                    int totalImgSelected = result.getData().getClipData().getItemCount();

                    Uri imgUri;

                    while (currImg <= totalImgSelected) {
//                        imgUri= result.getData().getData();

                        imgUri = result.getData().getClipData().getItemAt(currImg).getUri();
                        imageList.add(imgUri);
                        currImg++;
                        Log.i("Image Intent: ", imgUri.toString());
                    }

                }

            }
        });
        return startIntentActivityResultLauncher;
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode==100){
            if (grantResults.length>0 && grantResults[0]==PackageManager.PERMISSION_GRANTED) {
                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);//, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                intent.setType("image/*");
//            intent.putExtra(Intent.ACTION_PICK, 1);
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
                getIntentActivityResultLauncher().launch(Intent.createChooser(intent, "Select item(s)"));
            }else{
                Toast.makeText(this, "Permission not granted", Toast.LENGTH_SHORT).show();
            }
        }
    }
}