import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '10.82, 206.24'),
    );
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        title: const Text(
          '10.82, 206.24',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.menu, color: Colors.white, size: 24.0))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: 228,
                height: 45,
                child: Text(
                  'Ho Chi Minh City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: 152,
                height: 120,
                child: Image.asset('assets/image/thunder_sun.png'),
              ),
              Container(
                width: 86,
                height: 26,
                child: Text(
                  'Soft light',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                width: 160,
                height: 95,
                child: Text(
                  '32°C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 64.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                  width: 360,
                  height: 70,
                  child: Text(
                    'Duststorm, sandstorm, drifting or blowing snow',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  )),
              weatherDetail()
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherDetail() {
    return Opacity(
      opacity: 0.4,
      child: Container(
        width: 360,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Humidity(text: '40'),
                  SizedBox(
                    width: 70,
                  ),
                  Wind(text: '2')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text Humidity({
    required String text,
  }) {
    return Text(
      'Humidity $text%',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text Wind({
    required String text,
  }) {
    return Text(
      'Wind ${text}km/h',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text PM10({
    required String text,
  }) {
    return Text(
      'PM10 $textμg/m³',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }
}
