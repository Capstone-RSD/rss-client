package com.example.rss_client;

import android.util.Log;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import java.util.Properties;

public class RSSKafkaClient {
    private final Properties props;
private final KafkaProducer<String,Client.Builder> producer;
    public RSSKafkaClient() {
        props = new Properties();
        props.put("bootstrap.servers", "localhost:9092");
        props.put("linger.ms", 1);
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        producer = new KafkaProducer<>(props);
    }

    public void send(Client.Builder client){
        producer.send(new ProducerRecord<String, Client.Builder>("my-topic", "my-key", client), new Callback() {
            @Override
            public void onCompletion(RecordMetadata metadata, Exception exception) {
                // executes every time a record is successfully sent or an exception is thrown
                if (exception == null) {
                    // the record was successfully sent
                    Log.i("Kafka Producer","Received new metadata. \n" +
                            "Topic:" + metadata.topic() + "\n" +
                            "Partition: " + metadata.partition() + "\n" +
                            "Offset: " + metadata.offset() + "\n" + client.toString() + "\n" +
                            "Timestamp: " + metadata.timestamp());
                } else {
                    Log.e("Kafka Producer Error", exception.getMessage());
                }
            }
        });
    }

    public void close(){
        producer.close();
    }

}
