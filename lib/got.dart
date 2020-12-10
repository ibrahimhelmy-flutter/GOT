// To parse this JSON data, do
//
//     final got = gotFromJson(jsonString);

import 'dart:convert';

Got gotFromJson(String str) => Got.fromJson(json.decode(str));

String gotToJson(Got data) => json.encode(data.toJson());

class Got {
  Got({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.premiered,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.externals,
    this.myImage,
    this.summary,
    this.updated,
    this.links,
    this.embedded,
  });

  int id;
  String url;
  String name;
  String type;
  String language;
  List<String> genres;
  String status;
  int runtime;
  DateTime premiered;
  String officialSite;
  Schedule schedule;
  Rating rating;
  int weight;
  Network network;
  Network webChannel;
  Externals externals;
  MyImage myImage;
  String summary;
  int updated;
  GotLinks links;
  Embedded embedded;

  factory Got.fromJson(Map<String, dynamic> json) => Got(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    type: json["type"],
    language: json["language"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    status: json["status"],
    runtime: json["runtime"],
    premiered: DateTime.parse(json["premiered"]),
    officialSite: json["officialSite"],
    schedule: Schedule.fromJson(json["schedule"]),
    rating: Rating.fromJson(json["rating"]),
    weight: json["weight"],
    network: Network.fromJson(json["network"]),
    webChannel: Network.fromJson(json["webChannel"]),
    externals: Externals.fromJson(json["externals"]),
    myImage: MyImage.fromJson(json["image"]),
    summary: json["summary"],
    updated: json["updated"],
    links: GotLinks.fromJson(json["_links"]),
    embedded: Embedded.fromJson(json["_embedded"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "type": type,
    "language": language,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "status": status,
    "runtime": runtime,
    "premiered": "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
    "officialSite": officialSite,
    "schedule": schedule.toJson(),
    "rating": rating.toJson(),
    "weight": weight,
    "network": network.toJson(),
    "webChannel": webChannel.toJson(),
    "externals": externals.toJson(),
    "image": myImage.toJson(),
    "summary": summary,
    "updated": updated,
    "_links": links.toJson(),
    "_embedded": embedded.toJson(),
  };
}

class Embedded {
  Embedded({
    this.episodes,
  });

  List<Episode> episodes;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
  };
}

class Episode {
  Episode({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.myImage,
    this.summary,
    this.links,
  });

  int id;
  String url;
  String name;
  int season;
  int number;
  Type type;
  DateTime airdate;
  Time airtime;
  DateTime airstamp;
  int runtime;
  MyImage myImage;
  String summary;
  EpisodeLinks links;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    season: json["season"],
    number: json["number"],
    type: typeValues.map[json["type"]],
    airdate: DateTime.parse(json["airdate"]),
    airtime: timeValues.map[json["airtime"]],
    airstamp: DateTime.parse(json["airstamp"]),
    runtime: json["runtime"],
    myImage: MyImage.fromJson(json["image"]),
    summary: json["summary"],
    links: EpisodeLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "season": season,
    "number": number,
    "type": typeValues.reverse[type],
    "airdate": "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
    "airtime": timeValues.reverse[airtime],
    "airstamp": airstamp.toIso8601String(),
    "runtime": runtime,
    "image": myImage.toJson(),
    "summary": summary,
    "_links": links.toJson(),
  };
}

enum Time { THE_2100 }

final timeValues = EnumValues({
  "21:00": Time.THE_2100
});

class MyImage {
  MyImage({
    this.medium,
    this.original,
  });

  String medium;
  String original;

  factory MyImage.fromJson(Map<String, dynamic> json) => MyImage(
    medium: json["medium"],
    original: json["original"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "original": original,
  };
}

class EpisodeLinks {
  EpisodeLinks({
    this.self,
  });

  Previousepisode self;

  factory EpisodeLinks.fromJson(Map<String, dynamic> json) => EpisodeLinks(
    self: Previousepisode.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
  };
}

class Previousepisode {
  Previousepisode({
    this.href,
  });

  String href;

  factory Previousepisode.fromJson(Map<String, dynamic> json) => Previousepisode(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

enum Type { REGULAR }

final typeValues = EnumValues({
  "regular": Type.REGULAR
});

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  int tvrage;
  int thetvdb;
  String imdb;

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
    tvrage: json["tvrage"],
    thetvdb: json["thetvdb"],
    imdb: json["imdb"],
  );

  Map<String, dynamic> toJson() => {
    "tvrage": tvrage,
    "thetvdb": thetvdb,
    "imdb": imdb,
  };
}

class GotLinks {
  GotLinks({
    this.self,
    this.previousepisode,
  });

  Previousepisode self;
  Previousepisode previousepisode;

  factory GotLinks.fromJson(Map<String, dynamic> json) => GotLinks(
    self: Previousepisode.fromJson(json["self"]),
    previousepisode: Previousepisode.fromJson(json["previousepisode"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
    "previousepisode": previousepisode.toJson(),
  };
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
  });

  int id;
  String name;
  Country country;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],
    name: json["name"],
    country: Country.fromJson(json["country"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country.toJson(),
  };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String name;
  String code;
  String timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
    code: json["code"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "timezone": timezone,
  };
}

class Rating {
  Rating({
    this.average,
  });

  double average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    average: json["average"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "average": average,
  };
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  Time time;
  List<String> days;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    time: timeValues.map[json["time"]],
    days: List<String>.from(json["days"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "time": timeValues.reverse[time],
    "days": List<dynamic>.from(days.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
