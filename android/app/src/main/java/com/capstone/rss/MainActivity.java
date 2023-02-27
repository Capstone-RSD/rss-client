package com.capstone.rss;

import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;

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
//import com.example.rss.rssclient.Client;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "publishEvent";
    private static final String URL = "https://pkc-v12gj.northamerica-northeast2.gcp.confluent.cloud:443/kafka/v3/clusters";
    private static final String TOPIC = "/rss_topic";
    private static final String CLUSTER_ID = "/lkc-j375wq";
    private static final Integer SCHEMA_ID = 100001;
    private static final String API_KEY = "QkhKTEtLNDY0TlE2RUk2NDp3OHBkWWVTSEdDRml6UEFodG9BL2I2ZjdkN1o1c29VTTBxcTFydE9QNlU2Um9IWnB1SHllWnFFUlFYNnptdDQ3";
//    private Client.Builder rssClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
//        https://docs.flutter.dev/development/platform-integration/platform-channels?tab=android-channel-java-tab
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // This method is invoked on the main thread.
                            JSONObject client = call.argument("client");
//                            assert client != null;
                            Log.i("Info Client",client.toString());
                            if (call.method.equals(CHANNEL)) {
                                publishEvent(client);
                            }
                                 else {
                                    result.error("Publish Error", "Event was not published to the Kafka Cluster", null);
                                }
//                            } else {
//                                result.notImplemented();
//                            }
                        }
                );
    }

    /**
     * Sends the rssClient data to the Kafka Broker in a post request
     *
     * @return string
     */
    private void publishEvent (JSONObject client) {
        Log.i("publishEvent", "onMethodCall: " + client);

//        final String[] res = {""};

        JSONObject body = new JSONObject();
        JSONObject key = new JSONObject();
        JSONObject value = new JSONObject();
        try {
            key.put("subject_name_strategy", TOPIC.toUpperCase());
            key.put("schema_id", JSONObject.NULL);
            key.put("data", JSONObject.NULL);

            value.put("type", "JSON");
            value.put("data", client);

            Log.d("key", key.toString());
            Log.d("value", value.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            body.put("key", JSONObject.NULL);
            body.put("value", value);
            Log.d("Body", client.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }

        String postUrl = URL + CLUSTER_ID + "/topics" + TOPIC + "/records";
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.POST, postUrl, body, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Log.d("Volley REST Response", response.toString());
//                res[0] = response.toString();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("Volley Response error", "onCreate: " + error.networkResponse.toString());
//                res[0] = error.networkResponse.toString();
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

//            @Override
//            public byte[] getBody() {
//                JSONObject body = new JSONObject();
//                JSONObject key = new JSONObject();
//                JSONObject value = new JSONObject();
//                try {
//                    key.put("subject_name_strategy", TOPIC.toUpperCase());
//                    key.put("schema_id", JSONObject.NULL);
//                    key.put("data", JSONObject.NULL);
//
//                    value.put("type", "JSON");
//                    value.put("data", client);
//
//                    Log.d("key", key.toString());
//                    Log.d("value", value.toString());
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
////                catch (InvalidProtocolBufferException e) {
////                    e.printStackTrace();
////                }
//                try {
//                    body.put("key", JSONObject.NULL);
//                    body.put("value", value);
//                    Log.d("Body", client.toString());
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
//
//                return body.getBytes(StandardCharsets.UTF_8);
//            }

//            @Override
//            protected Response parseNetworkResponse(NetworkResponse response) {
//                try {
//                    Log.i("Kafka rest proxy", "response data " + response.data);
//                    String jsonString = new String(response.data, HttpHeaderParser.parseCharset(response.headers));
//                    return Response.success(new JSONObject(jsonString), HttpHeaderParser.parseCacheHeaders(response));
//                } catch (UnsupportedEncodingException | JSONException e) {
//                    return Response.error(new ParseError(e));
//                }
//            }

        };
        Log.d("Kafka Proxy URL", stringRequest.getUrl());
        RequestQueue resquestQueue = Volley.newRequestQueue(MainActivity.this);
        resquestQueue.add(stringRequest);

//        return res[0];
    }

}
