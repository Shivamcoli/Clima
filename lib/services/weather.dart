import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey='4d2f7d9d61978d212b94a3a265ac8aae';
const openWeathermapURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url='$openWeathermapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkhelper=NetworkHelper(url);
    var weatherData=await networkhelper.getData();
    return weatherData;
  }

  late double latitude;
  late double longitude;
  Future<dynamic> getLocationWeather() async{
  Location location=Location();
  await location.getCurrentLocation();
  longitude=(location.longitude);
  latitude=(location.latitude);

  NetworkHelper networkhelper=NetworkHelper(
      '$openWeathermapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

  var weatherData=await networkhelper.getData();
  return weatherData;
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}