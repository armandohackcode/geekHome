import 'package:appgeekhome/domain/models/comic_image.dart';
import 'package:appgeekhome/domain/models/item_detail.dart';

class ComicVine {
  String apiDetailUrl;
  String? boxOfficeRevenue;
  String? budget;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  String? deck;
  String? description;
  dynamic distributor;
  dynamic hasStaffReview;
  int id;
  ComicImage image;
  String name;
  List<ItemDetail>? producers;
  String? rating;
  DateTime? releaseDate;
  String? runtime;
  String siteDetailUrl;
  List<ItemDetail>? studios;
  String? totalRevenue;
  List<ItemDetail>? writers;

  ComicVine({
    required this.apiDetailUrl,
    required this.boxOfficeRevenue,
    required this.budget,
    required this.dateAdded,
    this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.distributor,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.name,
    required this.producers,
    required this.rating,
    required this.releaseDate,
    required this.runtime,
    required this.siteDetailUrl,
    required this.studios,
    required this.totalRevenue,
    required this.writers,
  });

  ComicVine copyWith({
    String? apiDetailUrl,
    String? boxOfficeRevenue,
    String? budget,
    DateTime? dateAdded,
    DateTime? dateLastUpdated,
    String? deck,
    String? description,
    dynamic distributor,
    dynamic hasStaffReview,
    int? id,
    ComicImage? image,
    String? name,
    List<ItemDetail>? producers,
    String? rating,
    DateTime? releaseDate,
    String? runtime,
    String? siteDetailUrl,
    List<ItemDetail>? studios,
    String? totalRevenue,
    List<ItemDetail>? writers,
  }) =>
      ComicVine(
        apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        boxOfficeRevenue: boxOfficeRevenue ?? this.boxOfficeRevenue,
        budget: budget ?? this.budget,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastUpdated: dateLastUpdated ?? this.dateLastUpdated,
        deck: deck ?? this.deck,
        description: description ?? this.description,
        distributor: distributor ?? this.distributor,
        hasStaffReview: hasStaffReview ?? this.hasStaffReview,
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        producers: producers ?? this.producers,
        rating: rating ?? this.rating,
        releaseDate: releaseDate ?? this.releaseDate,
        runtime: runtime ?? this.runtime,
        siteDetailUrl: siteDetailUrl ?? this.siteDetailUrl,
        studios: studios ?? this.studios,
        totalRevenue: totalRevenue ?? this.totalRevenue,
        writers: writers ?? this.writers,
      );

  factory ComicVine.fromJson(Map<String, dynamic> json) => ComicVine(
        apiDetailUrl: json["api_detail_url"],
        boxOfficeRevenue: json["box_office_revenue"],
        budget: json["budget"],
        dateAdded: DateTime.tryParse(json["date_added"]),
        dateLastUpdated: DateTime.tryParse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        distributor: json["distributor"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: ComicImage.fromJson(json["image"]),
        name: json["name"] ?? "",
        producers: json["producers"] == null
            ? []
            : List<ItemDetail>.from(
                json["producers"]!.map((x) => ItemDetail.fromJson(x))),
        rating: json["rating"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        runtime: json["runtime"],
        siteDetailUrl: json["site_detail_url"] ?? "",
        studios: json["studios"] == null
            ? []
            : List<ItemDetail>.from(
                json["studios"]!.map((x) => ItemDetail.fromJson(x))),
        totalRevenue: json["total_revenue"],
        writers: json["writers"] == null
            ? []
            : List<ItemDetail>.from(
                json["writers"]!.map((x) => ItemDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "box_office_revenue": boxOfficeRevenue,
        "budget": budget,
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "distributor": distributor,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toJson(),
        "name": name,
        "producers": producers == null
            ? []
            : List<dynamic>.from(producers!.map((x) => x.toJson())),
        "rating": rating,
        "release_date": releaseDate?.toIso8601String(),
        "runtime": runtime,
        "site_detail_url": siteDetailUrl,
        "studios": studios == null
            ? []
            : List<dynamic>.from(studios!.map((x) => x.toJson())),
        "total_revenue": totalRevenue,
        "writers": writers == null
            ? []
            : List<dynamic>.from(writers!.map((x) => x.toJson())),
      };
}
