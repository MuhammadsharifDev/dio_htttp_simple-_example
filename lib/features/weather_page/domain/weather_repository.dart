import 'package:dio/dio.dart';
import 'package:dio_example/core/server_error.dart';
import 'package:dio_example/features/weather_page/data/model/get_weather_response.dart';

class WeatherRepository {
  final dio = Dio()
    ..options = BaseOptions(
      contentType: 'application/json',
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(
        seconds: 300,
      ),
    )
    ..interceptors.addAll(
      [
        LogInterceptor(responseBody: true, requestBody: true),
      ],
    );

  Future<GetWeatherResponse> getWeather() async {
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=41.340912&lon=60.7992137&appid=bd456bd69a1f03a37ee24948ec0caf54');
      if(response.statusCode == 200 || response.statusCode == 201) {
        return GetWeatherResponse.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: 'Something has Errorrrrr==>!!!!!');
    }
  }
}
