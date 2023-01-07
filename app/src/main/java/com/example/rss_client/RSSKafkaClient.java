package com.example.rss_client;

import android.util.Log;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import java.util.Properties;

public class RSSKafkaClient {
    private Properties props;
  KafkaProducer<String,Client.Builder> producer;
    public RSSKafkaClient() {
        props = new Properties();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092,localhost:9092,192.168.2.124:9092");
        props.put(ProducerConfig.LINGER_MS_CONFIG, String.valueOf(1));
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "org.apache.kafka.common.serialization.StringSerializer");
        producer = new KafkaProducer<String,Client.Builder>(props);
    }

    public void send(Client.Builder client){
        producer.send(new ProducerRecord<String, Client.Builder>("my_topic", client), new Callback() {
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
        producer.flush();producer.close();
    }

}
