import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({
    this.location,
    this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
      };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  Map<String, double>? airQuality;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"] ?? 0,
        lastUpdated: json["last_updated"] ?? "unavailable",
        tempC: json["temp_c"] ?? 0.0,
        tempF: json["temp_f"].toDouble() ?? 0,
        isDay: json["is_day"] ?? 0,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"].toDouble() ?? 0,
        windKph: json["wind_kph"].toDouble() ?? 0,
        windDegree: json["wind_degree"] ?? 0,
        windDir: json["wind_dir"] ?? "",
        pressureMb: json["pressure_mb"] ?? 0,
        pressureIn: json["pressure_in"].toDouble() ?? 0,
        precipMm: json["precip_mm"] ?? 0,
        precipIn: json["precip_in"] ?? 0,
        humidity: json["humidity"] ?? 0,
        cloud: json["cloud"] ?? 0,
        feelslikeC: json["feelslike_c"] ?? 0,
        feelslikeF: json["feelslike_f"].toDouble() ?? 0,
        visKm: json["vis_km"] ?? 0,
        visMiles: json["vis_miles"] ?? 0,
        uv: json["uv"] ?? 0,
        gustMph: json["gust_mph"].toDouble() ?? 0,
        gustKph: json["gust_kph"].toDouble() ?? 0,
        airQuality: Map.from(json["air_quality"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality": Map.from(airQuality!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"] ?? "unavailable",
        icon: json["icon"] ?? "unavailable",
        code: json["code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] ?? "unavailable",
        region: json["region"] ?? "unavailable",
        country: json["country"] ?? "unavailable",
        lat: json["lat"].toDouble() ?? 0,
        lon: json["lon"].toDouble() ?? 0,
        tzId: json["tz_id"] ?? "unavailable",
        localtimeEpoch: json["localtime_epoch"] ?? 0,
        localtime: json["localtime"] ?? "unavailable",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
