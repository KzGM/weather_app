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
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
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
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.menu, color: Colors.white, size: 24.0))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Ho Chi Minh City',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    child: Image.asset('assets/image/thunder_sun.png'),
                  ),
                  Container(
                    child: Text(
                      'Soft light',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    child: Text(
                      '32°C',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 64.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                      child: Text(
                    'Duststorm, sandstorm, drifting or blowing snow',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  WeatherDetail()
                ],
              ),
            ),
          ),
        ));
  }

  Widget WeatherDetail() {
    return Opacity(
      opacity: 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherDetailItem(text: 'Humidity', value: '40%'),
                    WeatherDetailItem(text: 'Wind', value: '2km/h')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDetailItem(text: 'Humidity', value: '40%'),
                      WeatherDetailItem(text: 'Humidity', value: '40%')
                    ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeatherDetailItem(text: 'Humidity', value: '40%'),
                    WeatherDetailItem(text: 'Humidity', value: '40%')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget WeatherDetailItem({required String text, required String value}) {
    return Text(
      '$text $value',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text Wind({
    required String text,
  }) {
    return Text(
      'Wind ${text}km/h',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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

  Text Sunrise({
    required String text,
  }) {
    return Text(
      'Sunrise $text',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text UV({
    required String text,
  }) {
    return Text(
      'UV $text',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text Sunset({
    required String text,
  }) {
    return Text(
      'Sunset $text',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
    );
  }
}
