// To parse this JSON data, do
//
//     final Post = PostFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
   required this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.url,
    this.slug,
    this.name,
    this.status,
    this.lastUpdated,
    this.net,
    this.windowEnd,
    this.windowStart,
    this.probability,
    this.holdreason,
    this.failreason,
    this.hashtag,
    this.launchServiceProvider,
    this.rocket,
    this.mission,
    this.pad,
    this.webcastLive,
    this.image,
    this.infographic,
    this.program,
    this.orbitalLaunchAttemptCount,
    this.locationLaunchAttemptCount,
    this.padLaunchAttemptCount,
    this.agencyLaunchAttemptCount,
    this.orbitalLaunchAttemptCountYear,
    this.locationLaunchAttemptCountYear,
    this.padLaunchAttemptCountYear,
    this.agencyLaunchAttemptCountYear,
  });

  String? id;
  String? url;
  String? slug;
  String? name;
  Status? status;
  DateTime? lastUpdated;
  DateTime? net;
  DateTime? windowEnd;
  DateTime? windowStart;
  int? probability;
  String? holdreason;
  String? failreason;
  String? hashtag;
  LaunchServiceProvider? launchServiceProvider;
  Rocket? rocket;
  Mission? mission;
  Pad? pad;
  bool? webcastLive;
  String? image;
  dynamic infographic;
  List<Program>? program;
  int? orbitalLaunchAttemptCount;
  int? locationLaunchAttemptCount;
  int? padLaunchAttemptCount;
  int? agencyLaunchAttemptCount;
  int? orbitalLaunchAttemptCountYear;
  int? locationLaunchAttemptCountYear;
  int? padLaunchAttemptCountYear;
  int? agencyLaunchAttemptCountYear;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    url: json["url"],
    slug: json["slug"],
    name: json["name"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    net: json["net"] == null ? null : DateTime.parse(json["net"]),
    windowEnd: json["window_end"] == null ? null : DateTime.parse(json["window_end"]),
    windowStart: json["window_start"] == null ? null : DateTime.parse(json["window_start"]),
    probability: json["probability"],
    holdreason: json["holdreason"],
    failreason: json["failreason"],
    hashtag: json["hashtag"],
    launchServiceProvider: json["launch_service_provider"] == null ? null : LaunchServiceProvider.fromJson(json["launch_service_provider"]),
    rocket: json["rocket"] == null ? null : Rocket.fromJson(json["rocket"]),
    mission: json["mission"] == null ? null : Mission.fromJson(json["mission"]),
    pad: json["pad"] == null ? null : Pad.fromJson(json["pad"]),
    webcastLive: json["webcast_live"],
    image: json["image"],
    infographic: json["infographic"],
    program: json["program"] == null ? [] : List<Program>.from(json["program"]!.map((x) => Program.fromJson(x))),
    orbitalLaunchAttemptCount: json["orbital_launch_attempt_count"],
    locationLaunchAttemptCount: json["location_launch_attempt_count"],
    padLaunchAttemptCount: json["pad_launch_attempt_count"],
    agencyLaunchAttemptCount: json["agency_launch_attempt_count"],
    orbitalLaunchAttemptCountYear: json["orbital_launch_attempt_count_year"],
    locationLaunchAttemptCountYear: json["location_launch_attempt_count_year"],
    padLaunchAttemptCountYear: json["pad_launch_attempt_count_year"],
    agencyLaunchAttemptCountYear: json["agency_launch_attempt_count_year"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "slug": slug,
    "name": name,
    "status": status?.toJson(),
    "last_updated": lastUpdated?.toIso8601String(),
    "net": net?.toIso8601String(),
    "window_end": windowEnd?.toIso8601String(),
    "window_start": windowStart?.toIso8601String(),
    "probability": probability,
    "holdreason": holdreason,
    "failreason": failreason,
    "hashtag": hashtag,
    "launch_service_provider": launchServiceProvider?.toJson(),
    "rocket": rocket?.toJson(),
    "mission": mission?.toJson(),
    "pad": pad?.toJson(),
    "webcast_live": webcastLive,
    "image": image,
    "infographic": infographic,
    "program": program == null ? [] : List<dynamic>.from(program!.map((x) => x.toJson())),
    "orbital_launch_attempt_count": orbitalLaunchAttemptCount,
    "location_launch_attempt_count": locationLaunchAttemptCount,
    "pad_launch_attempt_count": padLaunchAttemptCount,
    "agency_launch_attempt_count": agencyLaunchAttemptCount,
    "orbital_launch_attempt_count_year": orbitalLaunchAttemptCountYear,
    "location_launch_attempt_count_year": locationLaunchAttemptCountYear,
    "pad_launch_attempt_count_year": padLaunchAttemptCountYear,
    "agency_launch_attempt_count_year": agencyLaunchAttemptCountYear,
  };
}

class LaunchServiceProvider {
  LaunchServiceProvider({
    this.id,
    this.url,
    this.name,
    this.type,
  });

  int? id;
  String? url;
  String? name;
  Type? type;

  factory LaunchServiceProvider.fromJson(Map<String, dynamic> json) => LaunchServiceProvider(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "type": typeValues.reverse[type],
  };
}

enum Type { COMMERCIAL, GOVERNMENT, MULTINATIONAL }

final typeValues = EnumValues({
  "Commercial": Type.COMMERCIAL,
  "Government": Type.GOVERNMENT,
  "Multinational": Type.MULTINATIONAL
});

class Mission {
  Mission({
    this.id,
    this.name,
    this.description,
    this.launchDesignator,
    this.type,
    this.orbit,
  });

  int? id;
  String? name;
  String? description;
  dynamic launchDesignator;
  String? type;
  Status? orbit;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    launchDesignator: json["launch_designator"],
    type: json["type"],
    orbit: json["orbit"] == null ? null : Status.fromJson(json["orbit"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "launch_designator": launchDesignator,
    "type": type,
    "orbit": orbit?.toJson(),
  };
}

class Status {
  Status({
    this.id,
    this.name,
    this.abbrev,
    this.description,
  });

  int? id;
  String? name;
  String? abbrev;
  String? description;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["id"],
    name: json["name"],
    abbrev: json["abbrev"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "abbrev": abbrev,
    "description": description,
  };
}

class Pad {
  Pad({
    this.id,
    this.url,
    this.agencyId,
    this.name,
    this.infoUrl,
    this.wikiUrl,
    this.mapUrl,
    this.latitude,
    this.longitude,
    this.location,
    this.mapImage,
    this.totalLaunchCount,
    this.orbitalLaunchAttemptCount,
  });

  int? id;
  String? url;
  int? agencyId;
  String? name;
  dynamic infoUrl;
  String? wikiUrl;
  String? mapUrl;
  String? latitude;
  String? longitude;
  Location? location;
  String? mapImage;
  int? totalLaunchCount;
  int? orbitalLaunchAttemptCount;

  factory Pad.fromJson(Map<String, dynamic> json) => Pad(
    id: json["id"],
    url: json["url"],
    agencyId: json["agency_id"],
    name: json["name"],
    infoUrl: json["info_url"],
    wikiUrl: json["wiki_url"],
    mapUrl: json["map_url"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    mapImage: json["map_image"],
    totalLaunchCount: json["total_launch_count"],
    orbitalLaunchAttemptCount: json["orbital_launch_attempt_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "agency_id": agencyId,
    "name": name,
    "info_url": infoUrl,
    "wiki_url": wikiUrl,
    "map_url": mapUrl,
    "latitude": latitude,
    "longitude": longitude,
    "location": location?.toJson(),
    "map_image": mapImage,
    "total_launch_count": totalLaunchCount,
    "orbital_launch_attempt_count": orbitalLaunchAttemptCount,
  };
}

class Location {
  Location({
    this.id,
    this.url,
    this.name,
    this.countryCode,
    this.mapImage,
    this.totalLaunchCount,
    this.totalLandingCount,
  });

  int? id;
  String? url;
  String? name;
  CountryCode? countryCode;
  String? mapImage;
  int? totalLaunchCount;
  int? totalLandingCount;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    countryCode: countryCodeValues.map[json["country_code"]]!,
    mapImage: json["map_image"],
    totalLaunchCount: json["total_launch_count"],
    totalLandingCount: json["total_landing_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "country_code": countryCodeValues.reverse[countryCode],
    "map_image": mapImage,
    "total_launch_count": totalLaunchCount,
    "total_landing_count": totalLandingCount,
  };
}

enum CountryCode { JPN, USA, KAZ }

final countryCodeValues = EnumValues({
  "JPN": CountryCode.JPN,
  "KAZ": CountryCode.KAZ,
  "USA": CountryCode.USA
});

class Program {
  Program({
    this.id,
    this.url,
    this.name,
    this.description,
    this.agencies,
    this.imageUrl,
    this.startDate,
    this.endDate,
    this.infoUrl,
    this.wikiUrl,
    this.missionPatches,
  });

  int? id;
  String? url;
  String? name;
  String? description;
  List<LaunchServiceProvider>? agencies;
  String? imageUrl;
  DateTime? startDate;
  dynamic endDate;
  String? infoUrl;
  String? wikiUrl;
  List<dynamic>? missionPatches;

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    description: json["description"],
    agencies: json["agencies"] == null ? [] : List<LaunchServiceProvider>.from(json["agencies"]!.map((x) => LaunchServiceProvider.fromJson(x))),
    imageUrl: json["image_url"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"],
    infoUrl: json["info_url"],
    wikiUrl: json["wiki_url"],
    missionPatches: json["mission_patches"] == null ? [] : List<dynamic>.from(json["mission_patches"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "description": description,
    "agencies": agencies == null ? [] : List<dynamic>.from(agencies!.map((x) => x.toJson())),
    "image_url": imageUrl,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate,
    "info_url": infoUrl,
    "wiki_url": wikiUrl,
    "mission_patches": missionPatches == null ? [] : List<dynamic>.from(missionPatches!.map((x) => x)),
  };
}

class Rocket {
  Rocket({
    this.id,
    this.configuration,
  });

  int? id;
  Configuration? configuration;

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    id: json["id"],
    configuration: json["configuration"] == null ? null : Configuration.fromJson(json["configuration"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "configuration": configuration?.toJson(),
  };
}

class Configuration {
  Configuration({
    this.id,
    this.url,
    this.name,
    this.family,
    this.fullName,
    this.variant,
  });

  int? id;
  String? url;
  String? name;
  String? family;
  String? fullName;
  String? variant;

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    family: json["family"],
    fullName: json["full_name"],
    variant: json["variant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "family": family,
    "full_name": fullName,
    "variant": variant,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
