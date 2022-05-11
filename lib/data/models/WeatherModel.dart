import 'package:flutter/material.dart';

/// consolidated_weather : [{"id":5390686040883200,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"WSW","created":"2022-05-09T16:11:25.548501Z","applicable_date":"2022-05-09","min_temp":14.010000000000002,"max_temp":18.72,"the_temp":17.255000000000003,"wind_speed":7.648713925509689,"wind_direction":258.50802332005094,"air_pressure":1015.0,"humidity":58,"visibility":14.092698639942734,"predictability":70},{"id":4872420692328448,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"WNW","created":"2022-05-09T16:11:28.556715Z","applicable_date":"2022-05-10","min_temp":13.505,"max_temp":19.189999999999998,"the_temp":17.645,"wind_speed":9.506943830069725,"wind_direction":297.16742458183165,"air_pressure":1018.5,"humidity":52,"visibility":15.365888212837032,"predictability":70},{"id":4870658044461056,"weather_state_name":"Light Cloud","weather_state_abbr":"lc","wind_direction_compass":"WNW","created":"2022-05-09T16:11:31.489019Z","applicable_date":"2022-05-11","min_temp":12.695,"max_temp":18.799999999999997,"the_temp":17.380000000000003,"wind_speed":9.14141942674249,"wind_direction":299.5040096284065,"air_pressure":1020.0,"humidity":49,"visibility":15.989123518651077,"predictability":70},{"id":6408455851081728,"weather_state_name":"Clear","weather_state_abbr":"c","wind_direction_compass":"NW","created":"2022-05-09T16:11:34.482365Z","applicable_date":"2022-05-12","min_temp":12.92,"max_temp":22.295,"the_temp":21.95,"wind_speed":7.836130957795805,"wind_direction":305.35469728952563,"air_pressure":1019.5,"humidity":41,"visibility":16.36349966197407,"predictability":68},{"id":5134921073950720,"weather_state_name":"Clear","weather_state_abbr":"c","wind_direction_compass":"WNW","created":"2022-05-09T16:11:37.455930Z","applicable_date":"2022-05-13","min_temp":14.57,"max_temp":23.65,"the_temp":24.475,"wind_speed":5.834107216821761,"wind_direction":298.72958611610466,"air_pressure":1014.5,"humidity":43,"visibility":16.61298019565736,"predictability":68},{"id":6372687363440640,"weather_state_name":"Heavy Cloud","weather_state_abbr":"hc","wind_direction_compass":"WNW","created":"2022-05-09T16:11:40.470269Z","applicable_date":"2022-05-14","min_temp":15.515,"max_temp":24.89,"the_temp":22.73,"wind_speed":3.273857273522628,"wind_direction":294.0,"air_pressure":1013.0,"humidity":52,"visibility":9.999726596675416,"predictability":71}]
/// time : "2022-05-09T11:54:43.681583-07:00"
/// sun_rise : "2022-05-09T05:54:16.956336-07:00"
/// sun_set : "2022-05-09T19:35:35.338286-07:00"
/// timezone_name : "LMT"
/// parent : {"title":"California","location_type":"Region / State / Province","woeid":2347563,"latt_long":"37.271881,-119.270233"}
/// sources : [{"title":"BBC","slug":"bbc","url":"http://www.bbc.co.uk/weather/","crawl_rate":360},{"title":"Forecast.io","slug":"forecast-io","url":"http://forecast.io/","crawl_rate":480},{"title":"HAMweather","slug":"hamweather","url":"http://www.hamweather.com/","crawl_rate":360},{"title":"Met Office","slug":"met-office","url":"http://www.metoffice.gov.uk/","crawl_rate":180},{"title":"OpenWeatherMap","slug":"openweathermap","url":"http://openweathermap.org/","crawl_rate":360},{"title":"World Weather Online","slug":"world-weather-online","url":"http://www.worldweatheronline.com/","crawl_rate":360}]
/// title : "San Diego"
/// location_type : "City"
/// woeid : 2487889
/// latt_long : "32.715691,-117.161720"
/// timezone : "America/Los_Angeles"

class WeatherModel {
  WeatherModel({
      List<ConsolidatedWeather>? consolidatedWeather, 
      String? time, 
      String? sunRise, 
      String? sunSet, 
      String? timezoneName, 
      Parent? parent, 
      List<Sources>? sources, 
      String? title,
      String? locationType, 
      int? woeid, 
      String? lattLong, 
      String? timezone,}){
    _consolidatedWeather = consolidatedWeather;
    _time = time;
    _sunRise = sunRise;
    _sunSet = sunSet;
    _timezoneName = timezoneName;
    _parent = parent;
    _sources = sources;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
    _timezone = timezone;
}

  WeatherModel.fromJson(dynamic json) {
    if (json['consolidated_weather'] != null) {
      _consolidatedWeather = [];
      json['consolidated_weather'].forEach((v) {
        _consolidatedWeather?.add(ConsolidatedWeather.fromJson(v));
      });
    }
    _time = json['time'];
    _sunRise = json['sun_rise'];
    _sunSet = json['sun_set'];
    _timezoneName = json['timezone_name'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
    _timezone = json['timezone'];
  }
  List<ConsolidatedWeather>? _consolidatedWeather;
  String? _time;
  String? _sunRise;
  String? _sunSet;
  String? _timezoneName;
  Parent? _parent;
  List<Sources>? _sources;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
  String? _timezone;
WeatherModel copyWith({  List<ConsolidatedWeather>? consolidatedWeather,
  String? time,
  String? sunRise,
  String? sunSet,
  String? timezoneName,
  Parent? parent,
  List<Sources>? sources,
  String? title,
  String? locationType,
  int? woeid,
  String? lattLong,
  String? timezone,
}) => WeatherModel(  consolidatedWeather: consolidatedWeather ?? _consolidatedWeather,
  time: time ?? _time,
  sunRise: sunRise ?? _sunRise,
  sunSet: sunSet ?? _sunSet,
  timezoneName: timezoneName ?? _timezoneName,
  parent: parent ?? _parent,
  sources: sources ?? _sources,
  title: title ?? _title,
  locationType: locationType ?? _locationType,
  woeid: woeid ?? _woeid,
  lattLong: lattLong ?? _lattLong,
  timezone: timezone ?? _timezone,
);
  List<ConsolidatedWeather>? get consolidatedWeather => _consolidatedWeather;
  String? get time => _time;
  String? get sunRise => _sunRise;
  String? get sunSet => _sunSet;
  String? get timezoneName => _timezoneName;
  Parent? get parent => _parent;
  List<Sources>? get sources => _sources;
  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;
  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_consolidatedWeather != null) {
      map['consolidated_weather'] = _consolidatedWeather?.map((v) => v.toJson()).toList();
    }
    map['time'] = _time;
    map['sun_rise'] = _sunRise;
    map['sun_set'] = _sunSet;
    map['timezone_name'] = _timezoneName;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    map['timezone'] = _timezone;
    return map;
  }

}

/// title : "BBC"
/// slug : "bbc"
/// url : "http://www.bbc.co.uk/weather/"
/// crawl_rate : 360

class Sources {
  Sources({
      String? title, 
      String? slug, 
      String? url, 
      int? crawlRate,}){
    _title = title;
    _slug = slug;
    _url = url;
    _crawlRate = crawlRate;
}

  Sources.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _url = json['url'];
    _crawlRate = json['crawl_rate'];
  }
  String? _title;
  String? _slug;
  String? _url;
  int? _crawlRate;
Sources copyWith({  String? title,
  String? slug,
  String? url,
  int? crawlRate,
}) => Sources(  title: title ?? _title,
  slug: slug ?? _slug,
  url: url ?? _url,
  crawlRate: crawlRate ?? _crawlRate,
);
  String? get title => _title;
  String? get slug => _slug;
  String? get url => _url;
  int? get crawlRate => _crawlRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['url'] = _url;
    map['crawl_rate'] = _crawlRate;
    return map;
  }

}

/// title : "California"
/// location_type : "Region / State / Province"
/// woeid : 2347563
/// latt_long : "37.271881,-119.270233"

class Parent {
  Parent({
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong,}){
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  Parent.fromJson(dynamic json) {
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
  }
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
Parent copyWith({  String? title,
  String? locationType,
  int? woeid,
  String? lattLong,
}) => Parent(  title: title ?? _title,
  locationType: locationType ?? _locationType,
  woeid: woeid ?? _woeid,
  lattLong: lattLong ?? _lattLong,
);
  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    return map;
  }

}

/// id : 5390686040883200
/// weather_state_name : "Light Cloud"
/// weather_state_abbr : "lc"
/// wind_direction_compass : "WSW"
/// created : "2022-05-09T16:11:25.548501Z"
/// applicable_date : "2022-05-09"
/// min_temp : 14.010000000000002
/// max_temp : 18.72
/// the_temp : 17.255000000000003
/// wind_speed : 7.648713925509689
/// wind_direction : 258.50802332005094
/// air_pressure : 1015.0
/// humidity : 58
/// visibility : 14.092698639942734
/// predictability : 70

class ConsolidatedWeather {
  ConsolidatedWeather({
      int? id, 
      String? weatherStateName, 
      String? weatherStateAbbr, 
      String? windDirectionCompass, 
      String? created, 
      String? applicableDate, 
      double? minTemp, 
      double? maxTemp, 
      double? theTemp, 
      double? windSpeed, 
      double? windDirection, 
      double? airPressure, 
      int? humidity, 
      double? visibility, 
      int? predictability,}){
    _id = id;
    _weatherStateName = weatherStateName;
    _weatherStateAbbr = weatherStateAbbr;
    _windDirectionCompass = windDirectionCompass;
    _created = created;
    _applicableDate = applicableDate;
    _minTemp = minTemp;
    _maxTemp = maxTemp;
    _theTemp = theTemp;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _airPressure = airPressure;
    _humidity = humidity;
    _visibility = visibility;
    _predictability = predictability;
}

  ConsolidatedWeather.fromJson(dynamic json) {
    _id = json['id'];
    _weatherStateName = json['weather_state_name'];
    _weatherStateAbbr = json['weather_state_abbr'];
    _windDirectionCompass = json['wind_direction_compass'];
    _created = json['created'];
    _applicableDate = json['applicable_date'];
    _minTemp = json['min_temp'];
    _maxTemp = json['max_temp'];
    _theTemp = json['the_temp'];
    _windSpeed = json['wind_speed'];
    _windDirection = json['wind_direction'];
    _airPressure = json['air_pressure'];
    _humidity = json['humidity'];
    _visibility = json['visibility'];
    _predictability = json['predictability'];
  }
  int? _id;
  String? _weatherStateName;
  String? _weatherStateAbbr;
  String? _windDirectionCompass;
  String? _created;
  String? _applicableDate;
  double? _minTemp;
  double? _maxTemp;
  double? _theTemp;
  double? _windSpeed;
  double? _windDirection;
  double? _airPressure;
  int? _humidity;
  double? _visibility;
  int? _predictability;
ConsolidatedWeather copyWith({  int? id,
  String? weatherStateName,
  String? weatherStateAbbr,
  String? windDirectionCompass,
  String? created,
  String? applicableDate,
  double? minTemp,
  double? maxTemp,
  double? theTemp,
  double? windSpeed,
  double? windDirection,
  double? airPressure,
  int? humidity,
  double? visibility,
  int? predictability,
}) => ConsolidatedWeather(  id: id ?? _id,
  weatherStateName: weatherStateName ?? _weatherStateName,
  weatherStateAbbr: weatherStateAbbr ?? _weatherStateAbbr,
  windDirectionCompass: windDirectionCompass ?? _windDirectionCompass,
  created: created ?? _created,
  applicableDate: applicableDate ?? _applicableDate,
  minTemp: minTemp ?? _minTemp,
  maxTemp: maxTemp ?? _maxTemp,
  theTemp: theTemp ?? _theTemp,
  windSpeed: windSpeed ?? _windSpeed,
  windDirection: windDirection ?? _windDirection,
  airPressure: airPressure ?? _airPressure,
  humidity: humidity ?? _humidity,
  visibility: visibility ?? _visibility,
  predictability: predictability ?? _predictability,
);
  int? get id => _id;
  String? get weatherStateName => _weatherStateName;
  String? get weatherStateAbbr => _weatherStateAbbr;
  String? get windDirectionCompass => _windDirectionCompass;
  String? get created => _created;
  String? get applicableDate => _applicableDate;
  double? get minTemp => _minTemp;
  double? get maxTemp => _maxTemp;
  double? get theTemp => _theTemp;
  double? get windSpeed => _windSpeed;
  double? get windDirection => _windDirection;
  double? get airPressure => _airPressure;
  int? get humidity => _humidity;
  double? get visibility => _visibility;
  int? get predictability => _predictability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['weather_state_name'] = _weatherStateName;
    map['weather_state_abbr'] = _weatherStateAbbr;
    map['wind_direction_compass'] = _windDirectionCompass;
    map['created'] = _created;
    map['applicable_date'] = _applicableDate;
    map['min_temp'] = _minTemp;
    map['max_temp'] = _maxTemp;
    map['the_temp'] = _theTemp;
    map['wind_speed'] = _windSpeed;
    map['wind_direction'] = _windDirection;
    map['air_pressure'] = _airPressure;
    map['humidity'] = _humidity;
    map['visibility'] = _visibility;
    map['predictability'] = _predictability;
    return map;
  }

  //Todo:5leha trg3 Color


}