import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
String apiKey = dotenv.env['OPENWEATHERMAP_API_KEY']!;
String openWeatherMapUrl = 'api.openweathermap.org';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    Uri uri = Uri.https(
      openWeatherMapUrl,
      '/data/2.5/weather',
      {
        'q': cityName,
        'appid': apiKey,
        'units': 'metric',
      },
    );
    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
}

  Future<dynamic> getLocationWeather() async
  {
    Location location = Location();
    await location.getCurrentLocation();
    Uri uri = Uri.https(openWeatherMapUrl, '/data/2.5/weather',
        {
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
          'appid': apiKey,
          'units': 'metric',
        });
    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
