import 'package:flutter/material.dart';
import 'package:weather_app/OnClass/weather_city.dart';
// void main(){
//   runApp(ListViewApp())
// }

// ignore: must_be_immutable
class ListViewApp extends StatelessWidget {
  ListViewApp({super.key});
  List<WeatherCity> weatherCities = [
    WeatherCity(
        city: 'Hồ Chí Minh',
        time: DateTime.now(),
        weatherDesc: 'Sunny thunderstorm',
        status: WeatherStatus.sunny,
        temperature: 32),
    WeatherCity(
        city: 'Hà Nội',
        time: DateTime.now(),
        weatherDesc: 'Sunny thunderstorm',
        status: WeatherStatus.sunny,
        temperature: 26),
    WeatherCity(
        city: 'New York',
        time: DateTime.now(),
        weatherDesc: 'Peace Night',
        status: WeatherStatus.sunny,
        temperature: 12),
    WeatherCity(
        city: 'London',
        time: DateTime.now(),
        weatherDesc: 'Peace Night',
        status: WeatherStatus.sunny,
        temperature: 6),
    WeatherCity(
        city: 'Seoul',
        time: DateTime.now(),
        weatherDesc: 'Sunny thunderstorm',
        status: WeatherStatus.rain,
        temperature: 21),
    WeatherCity(
        city: 'Paris',
        time: DateTime.now(),
        weatherDesc: 'Peace Night',
        status: WeatherStatus.sunny,
        temperature: 7)
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Container _buildItem(WeatherCity weatherCity) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blue[400]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherCity.city,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column()
        ],
      ),
    );
  }
}
