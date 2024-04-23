import 'dart:ffi';
import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/OnClass/custom_scroll_widget.dart';
import 'package:weather_app/OnClass/gridview.dart';
import 'package:weather_app/OnClass/listview.dart';
import 'package:weather_app/datepicker.dart';
import 'package:weather_app/profile.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 26, 34, 50)),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings){
        switch (settings.name){
          case '/':
          return MaterialPageRoute(builder: (context) => const)
        }
      },
      home: CustomScrollViewWidget(),
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

enum Gender { male, female, other }

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Gender selectedGender = Gender.male;

  void _Genderhandle(Gender? newGender) {
    setState(() {
      selectedGender = newGender!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CheckboxGroup()),
    );
  }

  Widget CheckboxGroup() {
    return Wrap(
      children: [
        _buildCheckBox(title: 'Action'),
        _buildCheckBox(title: 'Animation'),
        _buildCheckBox(
          title: 'Love',
        ),
        _buildCheckBox(title: 'Comedy'),
      ],
    );
  }

  Map<String, bool> _checkBoxValue = {
    'Action': false,
    'Animation': false,
    'Love': false,
    'Comedy': false,
  };

  Widget _buildCheckBox({required String title}) {
    return CheckboxListTile(
      title: Text(title),
      value: _checkBoxValue[title],
      onChanged: (newValue) {
        setState(() {
          _checkBoxValue[title] = newValue!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget Radio() {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            _buildRadio('Male', Gender.male, Colors.blue),
            SizedBox(
              width: 10,
            ),
            _buildRadio('Female', Gender.female, Colors.red),
            SizedBox(
              width: 10,
            ),
            _buildRadio('Other', Gender.other, Colors.purple),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Gender đang được chọn là ${selectedGender.toString().split('.').last}',
          textAlign: TextAlign.center,
        )
      ])),
    );
  }

  Widget _buildRadio(String title, Gender value, Color ActiveColor) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: selectedGender == value ? ActiveColor : Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: RadioListTile<Gender>(
              title: Text(
                title,
                style: TextStyle(fontSize: 10),
              ),
              value: value,
              groupValue: selectedGender,
              onChanged: _Genderhandle,
              activeColor: ActiveColor,
            )));
  }
}
  


// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blue[200],
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.blue[200],
//           title: const Text(
//             '10.82, 206.24',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w400),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: null,
//                 icon: Icon(Icons.menu, color: Colors.white, size: 24.0))
//           ],
//         ),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   Container(
//                     child: Text(
//                       'Ho Chi Minh City',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 24.0, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   Container(
//                     child: Image.asset('assets/image/thunder_sun.png'),
//                   ),
//                   Container(
//                     child: Text(
//                       'Soft light',
//                       style: TextStyle(
//                           fontSize: 20.0, fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       '32°C',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 64.0, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   Container(
//                       child: Text(
//                     'Duststorm, sandstorm, drifting or blowing snow',
//                     textAlign: TextAlign.center,
//                     style:
//                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
//                   )),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   WeatherDetail()
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }

//   Widget WeatherDetail() {
//     return Opacity(
//       opacity: 0.4,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.black,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     WeatherDetailItem(text: 'Humidity', value: '40%'),
//                     WeatherDetailItem(text: 'Wind', value: '2km/h')
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       WeatherDetailItem(text: 'Humidity', value: '40%'),
//                       WeatherDetailItem(text: 'Humidity', value: '40%')
//                     ]),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     WeatherDetailItem(text: 'Humidity', value: '40%'),
//                     WeatherDetailItem(text: 'Humidity', value: '40%')
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget WeatherDetailItem({required String text, required String value}) {
//     return Text(
//       '$text $value',
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }

//   Text Wind({
//     required String text,
//   }) {
//     return Text(
//       'Wind ${text}km/h',
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }

//   Text PM10({
//     required String text,
//   }) {
//     return Text(
//       'PM10 $textμg/m³',
//       style: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }

//   Text Sunrise({
//     required String text,
//   }) {
//     return Text(
//       'Sunrise $text',
//       style: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }

//   Text UV({
//     required String text,
//   }) {
//     return Text(
//       'UV $text',
//       style: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }

//   Text Sunset({
//     required String text,
//   }) {
//     return Text(
//       'Sunset $text',
//       style: TextStyle(
//           color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//     );
//   }
// }
