package com.example.rss.rssclient;

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
import com.example.rss_client.Client;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "rssChannel";
    private static final String URL = "https://pkc-3w22w.us-central1.gcp.confluent.cloud:443/kafka/v3/clusters";
    private static final String TOPIC = "/rss_topic";
    private static final String CLUSTER_ID = "/lkc-d91ond";
    private static final Integer SCHEMA_ID = 100001;
    private static final String API_KEY = "NzJOM1dWWFJLU1AzQUZTQTpvTkU2eWVyYkNSSStVR05XalIwVkhJSFNUQzJBbVp2NmlBRW5malp6Y0gvMWM3NHY3UDJnSVltd3hlRnJ3eFc4";
    private Client.Builder rssClient;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // This method is invoked on the main thread.
                            String x = call.argument("name");
//                    Log.i("rssChannel", "onMethodCall: " + x);
                            rssChannel(x);
                            result.success("lorem Ipsum");
                        }
                );
    }

    /**
     * Sends the rssClient data to the Kafka Broker in a post request
     */
    private void rssChannel(String client) {
        Log.i("rssChannel", "onMethodCall: " + client);

        String postUrl = URL + CLUSTER_ID + "/topics" + TOPIC + "/records";
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.POST, postUrl, null, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                Log.d("Volley REST Response", response.toString());
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d("Volley Response error", "onCreate: " + error.networkResponse.toString());
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

                    value.put("type", "JSON");
                    value.put("data", client);

                    Log.d("key", key.toString());
                    Log.d("value", value.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
//                catch (InvalidProtocolBufferException e) {
//                    e.printStackTrace();
//                }
                try {
                    body.put("key", JSONObject.NULL);
                    body.put("value", value);
                    Log.d("Body", client);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                return body.toString().getBytes();
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

}
