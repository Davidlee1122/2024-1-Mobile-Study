import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'networking.dart';
import 'model.dart';

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
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  String _weatherInfo = '';
  bool _loading = false;

  Future<void> _fetchWeather(String cityName, String apiKey) async {
    setState(() {
      _loading = true;
    });

    try {
      final dio = Dio();
      final weatherService = WeatherService(dio);
      final Model model = await weatherService.getWeather(cityName, apiKey);

      setState(() {
        _weatherInfo = '''
기온: ${model.main.temp}°C
습도: ${model.main.humidity}%
기압: ${model.main.pressure} hPa
풍속: ${model.wind.speed} m/s
        ''';
      });
    } catch (e) {
      setState(() {
        _weatherInfo = 'Error fetching weather data: $e';
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDSC 모바일 스터디'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final cityName = 'kor';
                final apiKey = '622022520e86309e9bfde0eccc37baff'; // 여기에 API 키를 입력하세요
                _fetchWeather(cityName, apiKey);
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            _loading
                ? CircularProgressIndicator()
                : Text(
              _weatherInfo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
