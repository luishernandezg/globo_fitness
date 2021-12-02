import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// http://api.openweathermap.org/data/2.5/weather?q=london&appid=9bf2fffad67fbbd4b83f9a031a10c9f3
class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '9bf2fffad67fbbd4b83f9a031a10c9f3';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    var url = Uri.https(authority, path, parameters);
    http.Response result = await http.get(url);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
