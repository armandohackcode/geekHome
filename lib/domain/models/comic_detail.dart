// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

import 'package:appgeekhome/domain/models/comic_image.dart';
import 'package:appgeekhome/domain/models/item_detail.dart';

ResponseApiDetail responseApiDetailFromJson(String str) =>
    ResponseApiDetail.fromJson(json.decode(str));

String responseApiDetailToJson(ResponseApiDetail data) =>
    json.encode(data.toJson());

class ResponseApiDetail {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  ComicDetail results;
  String version;

  ResponseApiDetail({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  ResponseApiDetail copyWith({
    String? error,
    int? limit,
    int? offset,
    int? numberOfPageResults,
    int? numberOfTotalResults,
    int? statusCode,
    ComicDetail? results,
    String? version,
  }) =>
      ResponseApiDetail(
        error: error ?? this.error,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        numberOfPageResults: numberOfPageResults ?? this.numberOfPageResults,
        numberOfTotalResults: numberOfTotalResults ?? this.numberOfTotalResults,
        statusCode: statusCode ?? this.statusCode,
        results: results ?? this.results,
        version: version ?? this.version,
      );

  factory ResponseApiDetail.fromJson(Map<String, dynamic> json) =>
      ResponseApiDetail(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: ComicDetail.fromJson(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results.toJson(),
        "version": version,
      };
}

class ComicDetail {
  String apiDetailUrl;
  List<ItemDetail> characters;
  List<ItemDetail> concepts;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  String deck;
  String description;
  int id;
  ComicImage image;
  List<ItemDetail> locations;
  String name;
  List<ItemDetail> objects;
  List<ItemDetail> producers;
  String rating;
  DateTime? releaseDate;
  String runtime;
  String siteDetailUrl;
  List<ItemDetail> studios;
  List<ItemDetail> teams;

  ComicDetail({
    this.apiDetailUrl = "",
    this.characters = const [],
    this.concepts = const [],
    this.dateAdded,
    this.dateLastUpdated,
    this.deck = "",
    this.description = "",
    this.id = 0,
    required this.image,
    this.locations = const [],
    this.name = "",
    this.objects = const [],
    this.producers = const [],
    this.rating = "",
    this.releaseDate,
    this.runtime = "",
    this.siteDetailUrl = "",
    this.studios = const [],
    this.teams = const [],
  });

  ComicDetail copyWith({
    String? apiDetailUrl,
    dynamic boxOfficeRevenue,
    dynamic budget,
    List<ItemDetail>? characters,
    List<ItemDetail>? concepts,
    DateTime? dateAdded,
    DateTime? dateLastUpdated,
    String? deck,
    String? description,
    int? id,
    ComicImage? image,
    List<ItemDetail>? locations,
    String? name,
    List<ItemDetail>? objects,
    List<ItemDetail>? producers,
    String? rating,
    DateTime? releaseDate,
    String? runtime,
    String? siteDetailUrl,
    List<ItemDetail>? studios,
    List<ItemDetail>? teams,
  }) =>
      ComicDetail(
        apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        characters: characters ?? this.characters,
        concepts: concepts ?? this.concepts,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastUpdated: dateLastUpdated ?? this.dateLastUpdated,
        deck: deck ?? this.deck,
        description: description ?? this.description,
        id: id ?? this.id,
        image: image ?? this.image,
        locations: locations ?? this.locations,
        name: name ?? this.name,
        objects: objects ?? this.objects,
        producers: producers ?? this.producers,
        rating: rating ?? this.rating,
        releaseDate: releaseDate ?? this.releaseDate,
        runtime: runtime ?? this.runtime,
        siteDetailUrl: siteDetailUrl ?? this.siteDetailUrl,
        studios: studios ?? this.studios,
        teams: teams ?? this.teams,
      );

  factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
        apiDetailUrl: json["api_detail_url"] ?? "",
        characters: json["characters"] == null
            ? []
            : List<ItemDetail>.from(
                json["characters"].map((x) => ItemDetail.fromJson(x))),
        concepts: json["concepts"] == null
            ? []
            : List<ItemDetail>.from(
                json["concepts"].map((x) => ItemDetail.fromJson(x))),
        dateAdded: DateTime.tryParse(json["date_added"]),
        dateLastUpdated: DateTime.tryParse(json["date_last_updated"]),
        deck: json["deck"] ?? "",
        description: json["description"] ?? "",
        id: json["id"],
        image: ComicImage.fromJson(json["image"]),
        locations: json["locations"] == null
            ? []
            : List<ItemDetail>.from(
                json["locations"].map((x) => ItemDetail.fromJson(x))),
        name: json["name"] ?? "",
        objects: json["objects"] == null
            ? []
            : List<ItemDetail>.from(
                json["objects"].map((x) => ItemDetail.fromJson(x))),
        producers: json["producers"] == null
            ? []
            : List<ItemDetail>.from(
                json["producers"].map((x) => ItemDetail.fromJson(x))),
        rating: json["rating"] ?? "",
        releaseDate: DateTime.tryParse(json["release_date"]),
        runtime: json["runtime"] ?? "",
        siteDetailUrl: json["site_detail_url"] ?? "",
        studios: json["studios"] == null
            ? []
            : List<ItemDetail>.from(
                json["studios"].map((x) => ItemDetail.fromJson(x))),
        teams: json["teams"] == null
            ? []
            : List<ItemDetail>.from(
                json["teams"].map((x) => ItemDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
        "concepts": List<dynamic>.from(concepts.map((x) => x.toJson())),
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "id": id,
        "image": image.toJson(),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "name": name,
        "objects": List<dynamic>.from(objects.map((x) => x.toJson())),
        "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
        "rating": rating,
        "release_date": releaseDate?.toIso8601String(),
        "runtime": runtime,
        "site_detail_url": siteDetailUrl,
        "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}
