// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.fairings,
    required this.links,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.tdb,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.failures,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.autoUpdate,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.id,
  });

  dynamic fairings;
  Links links;
  DateTime staticFireDateUtc;
  int staticFireDateUnix;
  bool tdb;
  bool net;
  int window;
  String rocket;
  bool success;
  List<dynamic> failures;
  String details;
  List<String> crew;
  List<String> ships;
  List<String> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  String id;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    fairings: json["fairings"],
    links: Links.fromJson(json["links"]),
    staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    tdb: json["tdb"],
    net: json["net"],
    window: json["window"],
    rocket: json["rocket"],
    success: json["success"],
    failures: List<dynamic>.from(json["failures"].map((x) => x)),
    details: json["details"],
    crew: List<String>.from(json["crew"].map((x) => x)),
    ships: List<String>.from(json["ships"].map((x) => x)),
    capsules: List<String>.from(json["capsules"].map((x) => x)),
    payloads: List<String>.from(json["payloads"].map((x) => x)),
    launchpad: json["launchpad"],
    autoUpdate: json["auto_update"],
    flightNumber: json["flight_number"],
    name: json["name"],
    dateUtc: DateTime.parse(json["date_utc"]),
    dateUnix: json["date_unix"],
    dateLocal: DateTime.parse(json["date_local"]),
    datePrecision: json["date_precision"],
    upcoming: json["upcoming"],
    cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fairings": fairings,
    "links": links.toJson(),
    "static_fire_date_utc": staticFireDateUtc.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "tdb": tdb,
    "net": net,
    "window": window,
    "rocket": rocket,
    "success": success,
    "failures": List<dynamic>.from(failures.map((x) => x)),
    "details": details,
    "crew": List<dynamic>.from(crew.map((x) => x)),
    "ships": List<dynamic>.from(ships.map((x) => x)),
    "capsules": List<dynamic>.from(capsules.map((x) => x)),
    "payloads": List<dynamic>.from(payloads.map((x) => x)),
    "launchpad": launchpad,
    "auto_update": autoUpdate,
    "flight_number": flightNumber,
    "name": name,
    "date_utc": dateUtc.toIso8601String(),
    "date_unix": dateUnix,
    "date_local": dateLocal.toIso8601String(),
    "date_precision": datePrecision,
    "upcoming": upcoming,
    "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
    "id": id,
  };
}

class Core {
  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landingAttempt,
    required this.landingSuccess,
    required this.landingType,
    required this.landpad,
  });

  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  bool landingSuccess;
  String landingType;
  String landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    core: json["core"],
    flight: json["flight"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landingAttempt: json["landing_attempt"],
    landingSuccess: json["landing_success"],
    landingType: json["landing_type"],
    landpad: json["landpad"],
  );

  Map<String, dynamic> toJson() => {
    "core": core,
    "flight": flight,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess,
    "landing_type": landingType,
    "landpad": landpad,
  };
}

class Links {
  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  Patch patch;
  Reddit reddit;
  Flickr flickr;
  String presskit;
  String webcast;
  String youtubeId;
  String article;
  String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    patch: Patch.fromJson(json["patch"]),
    reddit: Reddit.fromJson(json["reddit"]),
    flickr: Flickr.fromJson(json["flickr"]),
    presskit: json["presskit"],
    webcast: json["webcast"],
    youtubeId: json["youtube_id"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toJson() => {
    "patch": patch.toJson(),
    "reddit": reddit.toJson(),
    "flickr": flickr.toJson(),
    "presskit": presskit,
    "webcast": webcast,
    "youtube_id": youtubeId,
    "article": article,
    "wikipedia": wikipedia,
  };
}

class Flickr {
  Flickr({
    required this.small,
    required this.original,
  });

  List<dynamic> small;
  List<String> original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
    small: List<dynamic>.from(json["small"].map((x) => x)),
    original: List<String>.from(json["original"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "small": List<dynamic>.from(small.map((x) => x)),
    "original": List<dynamic>.from(original.map((x) => x)),
  };
}

class Patch {
  Patch({
    required this.small,
    required this.large,
  });

  String small;
  String large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "large": large,
  };
}

class Reddit {
  Reddit({
    required this.campaign,
    required this.launch,
    required this.media,
    required this.recovery,
  });

  String campaign;
  String launch;
  String media;
  String recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
    campaign: json["campaign"],
    launch: json["launch"],
    media: json["media"],
    recovery: json["recovery"],
  );

  Map<String, dynamic> toJson() => {
    "campaign": campaign,
    "launch": launch,
    "media": media,
    "recovery": recovery,
  };
}
