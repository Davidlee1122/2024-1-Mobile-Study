import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'model.dart';

part 'networking.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET('/weather')
  Future<Model> getWeather(
      @Query('q') String cityName,
      @Query('appid') String apiKey,
      );
}

