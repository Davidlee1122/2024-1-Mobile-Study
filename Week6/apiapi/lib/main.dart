import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey = "622022520e86309e9bfde0eccc37baff";
  String cityName = "kor"; // 기본값은 "kor"로 설정
  String temperature = "No Data~";
  String humidity = "No Data~";
  String pressure = "No Data~";
  String windSpeed = "No Data~";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                fetchWeatherData();
              },
              child: Text('날씨 API 받기'),
            ),
            SizedBox(height: 20),
            Text("기온 : $temperature"),
            Text("습도 : $humidity"),
            Text("기압 : $pressure"),
            Text("풍속 : $windSpeed"),
          ],
        ),
      ),
    );
  }

  Future<void> fetchWeatherData() async {
    setState(() {
      isLoading = true; // API 호출 전 로딩 상태로 변경
    });

    try {
      String apiCall =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";
      final response = await Dio().get(apiCall);

      setState(() {
        // API에서 받아온 데이터로 각 변수 초기화
        temperature = response?.data['main']['temp'].toString() ?? "No Data~";
        humidity = response?.data['main']['humidity'].toString() ?? "No Data~";
        pressure = response?.data['main']['pressure'].toString() ?? "No Data~";
        windSpeed = response?.data['wind']['speed'].toString() ?? "No Data~";
        isLoading = false; // API 호출 후 로딩 상태 해제
      });
    } catch (e) {
      setState(() {
        isLoading = false; // 에러 발생 시 로딩 상태 해제
      });
      print("Error fetching weather data: $e");
    }
  }
}
