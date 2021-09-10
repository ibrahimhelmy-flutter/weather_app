// import 'dart:ui';
//
// import 'package:flutter/foundation.dart';
// import 'package:weather_app/utils/app_color.dart';
//
// class Weather {
//   final String day;
//   final String iconUrl;
//   final int humidity;
//   final int degree;
//   final int minDegree;
//   final int maxDegree;
//   final Color color;
//   final String time;
//   final String filledIconUrl;
//
//   Weather({
//     this.day,
//     this.iconUrl,
//     this.humidity,
//     this.degree,
//     this.minDegree,
//     this.maxDegree,
//     this.color,
//     this.time,
//     this.filledIconUrl,
//   });
//
//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//         day: json['day'],
//         iconUrl: json['iconUrl'],
//         humidity: json['humidity'],
//         degree: json['degree'],
//         minDegree: json['minDegree'],
//         maxDegree: json['maxDegree'],
//         color: json['color'],
//         time: json['time'],
//         filledIconUrl: json['filledIconColor']);
//   }
// }
//
// class WeatherData {
//   List<Weather> getWeatherData() {
//     List<Weather> weathers = [];
//     Weather weather1 = Weather(
//         day: 'Monday',
//         iconUrl: 'assets/images/icons8_sun_24px.png',
//         humidity: 40,
//         degree: 20,
//         minDegree: 46,
//         maxDegree: 72,
//         color: AppColor.monColor,
//         time: '12:00',
//         filledIconUrl: 'assets/images/filled_sun.png');
//     weathers.add(weather1);
//     Weather weather2 = Weather(
//         day: 'Tuesday',
//         iconUrl: 'assets/images/icons8_sun_24px.png',
//         humidity: 60,
//         degree: 20,
//         minDegree: 48,
//         maxDegree: 56,
//         color: AppColor.tueColor,
//         time: '14:00',
//         filledIconUrl: 'assets/images/filled_rainy_cloud.png');
//     weathers.add(weather2);
//     Weather weather3 = Weather(
//         day: 'Wednesday',
//         iconUrl: 'assets/images/icons8_sun_24px.png',
//         humidity: 30,
//         degree: 20,
//         minDegree: 29,
//         maxDegree: 34,
//         color: AppColor.wedColor,
//         time: '09:00',
//         filledIconUrl: 'assets/images/filled_sunny_cloud.png');
//     weathers.add(weather3);
//     Weather weather4 = Weather(
//         day: 'Thursday',
//         iconUrl: 'assets/images/icons8_sun_24px.png',
//         humidity: 37,
//         degree: 20,
//         minDegree: 12,
//         maxDegree: 18,
//         color: AppColor.thurColor,
//         time: '20:00',
//         filledIconUrl: 'assets/images/filled_storm_cloud.png');
//     weathers.add(weather4);
//     Weather weather5 = Weather(
//         day: 'Friday',
//         iconUrl: 'assets/images/icons8_sun_24px.png',
//         humidity: 49,
//         degree: 20,
//         minDegree: 7,
//         maxDegree: 9,
//         color: AppColor.friColor,
//         time: '13:00',
//         filledIconUrl: 'assets/images/filled_sunny_cloud.png');
//     weathers.add(weather5);
//     return weathers;
//   }
// }

class WeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherList>? list;
  City? city;

  WeatherModel({this.cod, this.message, this.cnt, this.list, this.city});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list =  [];
      json['list'].forEach((v) {
        list!.add(new WeatherList.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class WeatherList {
  int? dt;
  Main? main;
  List<WeatherInfo>? weather;
  Clouds ?clouds;
  Wind? wind;
  int? visibility;
  dynamic? pop;
  Sys ?sys;
  String? dtTxt;
  Rain ?rain;

  WeatherList(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain});

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather =[];
      json['weather'].forEach((v) {
        weather!.add(new WeatherInfo.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['visibility'] = this.visibility;
    data['pop'] = this.pop;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    return data;
  }
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic seaLevel;
  dynamic grndLevel;
  dynamic humidity;
  dynamic tempKf;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['sea_level'] = this.seaLevel;
    data['grnd_level'] = this.grndLevel;
    data['humidity'] = this.humidity;
    data['temp_kf'] = this.tempKf;
    return data;
  }
}

class WeatherInfo {
  int ?id;
  String ?main;
  String? description;
  String? icon;

  WeatherInfo({this.id, this.main, this.description, this.icon});

  WeatherInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Wind {
  dynamic speed;
  dynamic deg;
  dynamic gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pod'] = this.pod;
    return data;
  }
}

class Rain {
  double? d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3h'] = this.d3h;
    return data;
  }
}

class City {
  int ?id;
  String ?name;
  Coord ?coord;
  String? country;
  dynamic population;
  dynamic timezone;
  dynamic sunrise;
  dynamic sunset;

  City(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Coord {
  dynamic lat;
  dynamic lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
