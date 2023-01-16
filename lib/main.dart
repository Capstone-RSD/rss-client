import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:rssclient/views/onboarding.dart';
import 'package:provider/provider.dart';

art';

// import 'package:rssclient/generated/rsd-dart-gen/rss_client.pb.dart';
import 'package:rssclient/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RSSClientThemeNotification(),
          ),
        ],
        child: Consumer<RSSClientThemeNotification>(builder:
            (BuildContext context, RSSClientThemeNotification notifier, child) {
          return MaterialApp(
            title: 'RSS Client',
            theme: notifier.darkTheme
                ? RSSClientThemes.dark
                : RSSClientThemes.light,

            // theme: RSSClientThemes.light,
            darkTheme: RSSClientThemes.dark,
            themeMode: ThemeMode.system,

            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const String URL = "pkc-3w22w.us-central1.gcp.confluent.cloud:443";
  static const String PATH = "/kafka/v3/clusters";

  // late final Client rssClient;
  static const String TOPIC = "/rss_topic";
  static const String CLUSTER_ID = "/lkc-d91ond";
  static const int SCHEMA_ID = 100001;
  static const String API_KEY = "";

  Future<void> _incrementCounter() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    print("$URL$CLUSTER_ID/topics$TOPIC/records");
    var url = Uri.https("$URL", "$PATH$CLUSTER_ID/topics$TOPIC/records");
    // URL + CLUSTER_ID + "/topics" + TOPIC + "/records";
    final Map<String, String> headers = {
      'Content-Type': "application/json",
      'Authorization': "Basic $API_KEY"
    };

    var data = {"name": "doodle", "color": "blue"};
    var key = "null";
    var value = "{'type': 'JSON', 'data': $data}";

    String body = jsonEncode(data);

    var res = await http.post(url,
        headers: {
          'Content-Type': "application/json",
          'Accept': "application/json",
          'Authorization': "Basic $API_KEY"
        },
        body: jsonEncode({"value": "value"}) as String);
    print(res.headers.toString());

    // if (res.statusCode == 200) {
    var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    // var uri = Uri.parse(decodedResponse['uri'] as String);
    print(decodedResponse);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
