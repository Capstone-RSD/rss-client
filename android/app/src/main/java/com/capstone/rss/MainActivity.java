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
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.HttpHeaderParser;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
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
    private static final String PUBLISH_CHANNEL = "publishEvent";
    private static final String PUBLISH_PRES_CHANNEL = "publishPresEvent";
    private static final String URL = "https://pkc-4rn2p.canadacentral.azure.confluent.cloud:443/kafka/v3/clusters";
    private static final String TOPIC = "/rss_topic";
    private static final String TOPIC_PRES = "/rss_pres_topic";
    private static final String CLUSTER_ID = "/lkc-knmw3m";
    private static final Integer SCHEMA_ID = 100001;
    private static final String API_KEY = BuildConfig.RSS_API_KEY;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // https://docs.flutter.dev/development/platform-integration/platform-channels?tab=android-channel-java-tab
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), PUBLISH_CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            boolean res;
                            Log.d("Client", String.valueOf(call.method.equals(PUBLISH_CHANNEL)));
                            if (call.method.equals(PUBLISH_CHANNEL)) {
                                // This method is invoked on the main thread.
                                JSONObject client = null;
                                try {
                                    client = new JSONObject(call.argument("client").toString());
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                                assert client != null;
//                            Log.i("Info Client", client.toString());
                                res = publishEvent(client);
                                if (res) {
                                    result.success("Successfully published event");
                                } else {
                                    result.error("Publish Error", "Event was not published to the Kafka Cluster", null);
                                }
                            } else if (call.method.equals(PUBLISH_PRES_CHANNEL)) {
                                Log.d("rss_state", call.argument("rss_state"));
                                res = publishPresEvent(call.argument("rss_state"));
                                if (res) {
                                    result.success("Successfully published event");
                                } else {
                                    result.error("Publish Error", "Event was not published to the Kafka Cluster", null);
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), PUBLISH_PRES_CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            boolean res;
                            Log.d("Channel", String.valueOf(call.method.equals(PUBLISH_CHANNEL)));
                             if (call.method.equals(PUBLISH_PRES_CHANNEL)) {
                                Log.d("rss_state", call.argument("rss_state"));
                                res = publishPresEvent(call.argument("rss_state"));
                                if (res) {
                                    result.success("Successfully published event");
                                } else {
                                    result.error("Publish Error", "Event was not published to the Kafka Cluster", null);
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    /**
     * Sends the rssClient data to the Kafka Broker in a post request
     * Publishes a RSS Client record to the Kafka cluster
     *
     * @param client The client is a proto msg in json format
     * @return {@code true} if the repuest returns 200 otherwise return {@code false}
     */
    private boolean publishEvent(JSONObject client) {
//        Log.i("publishEvent", "onMethodCall: " + client);

        final boolean[] res = {false};

        JSONObject body = new JSONObject();
        JSONObject key = new JSONObject();
        JSONObject value = new JSONObject();
        try {
            key.put("subject_name_strategy", TOPIC.toUpperCase());
            key.put("schema_id", JSONObject.NULL);
            key.put("data", JSONObject.NULL);

            value.put("type", "JSON");
            value.put("data", client);

//            Log.d("key", key.toString());
//            Log.d("value", value.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }
        try {
            body.put("key", JSONObject.NULL);
            body.put("value", value);
//            Log.d("Body", client.toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }


        String postUrl = URL + CLUSTER_ID + "/topics" + TOPIC + "/records";
        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.POST, postUrl, body, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                res[0] = true;
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

//                Log.d("headers", headers.toString());
                return headers;
            }

            @Override
            protected Response parseNetworkResponse(NetworkResponse response) {
                try {
//                    Log.i("Kafka rest proxy", "response data " + response.data);
                    String jsonString = new String(response.data, HttpHeaderParser.parseCharset(response.headers));
                    JSONObject ret_obj = new JSONObject(jsonString);
                    return Response.success(ret_obj, HttpHeaderParser.parseCacheHeaders(response));
                } catch (UnsupportedEncodingException | JSONException e) {
                    return Response.error(new ParseError(e));
                }
            }

        };
//        Log.d("Kafka Proxy URL", stringRequest.getUrl());
//        stringRequest.
        RequestQueue resquestQueue = Volley.newRequestQueue(MainActivity.this);
        resquestQueue.add(stringRequest);

        return res[0];
    }

    /**
     * Sends the rssClient app state data to the Kafka Broker in a post request
     * Publishes a RSS Client app record to the Kafka cluster
     *
     * @param message A string message
     * @return {@code true} if the request returns 200 otherwise return {@code false}
     */
    private boolean publishPresEvent(String message) {
//        Log.i("publishPresEvent", "onMethodCall: " + message);

        final boolean[] res = {false};

//        JSONObject body = new JSONObject();
//        JSONObject key = new JSONObject();
//        JSONObject value = new JSONObject();
//        try {
//            key.put("subject_name_strategy", TOPIC.toUpperCase());
//            key.put("schema_id", JSONObject.NULL);
//            key.put("data", JSONObject.NULL);
//
//            value.put("type", "JSON");
//            value.put("data", client);
//
//            Log.d("key", key.toString());
//            Log.d("value", value.toString());
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        try {
//            body.put("key", JSONObject.NULL);
//            body.put("value", value);
//            Log.d("Body", message.toString());
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }


        String postUrl = URL + CLUSTER_ID + "/topics" + TOPIC_PRES + "/records";
        StringRequest stringRequest = new StringRequest(Request.Method.POST, postUrl, new Response.Listener<String>() {
            /**
             * Called when a response is received.
             *
             * @param response
             */
            @Override
            public void onResponse(String response) {
                res[0] = true;
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
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Content-Type", "application/json");
                headers.put("Authorization", "Basic " + API_KEY);

                Log.d("headers", headers.toString());
                return headers;
            }

//            @Override
//            protected Response<String> parseNetworkResponse(NetworkResponse response) {
//                try {
//                    Log.i("Kafka rest proxy", "response data " + response.data);
//                  String re =  new Response.(response.data, HttpHeaderParser.parseCharset(response.headers));
//                  return  re;
////                    JSONObject ret_obj = new JSONObject(jsonString);
////                    return Response.success(ret_obj, HttpHeaderParser.parseCacheHeaders(response));
//                } catch (UnsupportedEncodingException | JSONException e) {
//                    return Response.error(new ParseError(e));
//                }
//            }

            /**
             * Returns the raw POST or PUT body to be sent.
             *
             * <p>By default, the body consists of the request parameters in
             * application/x-www-form-urlencoded format. When overriding this method, consider overriding
             * {@link #getBodyContentType()} as well to match the new body format.
             *
             * @throws AuthFailureError in the event of auth failure
             */
            @Override
            public byte[] getBody() throws AuthFailureError {
                return message == null ? null : message.getBytes(StandardCharsets.UTF_8);
            }
        };
        Log.d("Kafka Proxy URL", stringRequest.getUrl());
//        stringRequest.
        RequestQueue resquestQueue = Volley.newRequestQueue(MainActivity.this);
        resquestQueue.add(stringRequest);

        return res[0];
    }

}
