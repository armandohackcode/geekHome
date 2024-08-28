// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

import 'package:appgeekhome/domain/models/comic_vine.dart';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  List<ComicVine> results;
  String version;

  ResponseApi({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  ResponseApi copyWith({
    String? error,
    int? limit,
    int? offset,
    int? numberOfPageResults,
    int? numberOfTotalResults,
    int? statusCode,
    List<ComicVine>? results,
    String? version,
  }) =>
      ResponseApi(
        error: error ?? this.error,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        numberOfPageResults: numberOfPageResults ?? this.numberOfPageResults,
        numberOfTotalResults: numberOfTotalResults ?? this.numberOfTotalResults,
        statusCode: statusCode ?? this.statusCode,
        results: results ?? this.results,
        version: version ?? this.version,
      );

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: List<ComicVine>.from(
            json["results"].map((x) => ComicVine.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "version": version,
      };
}
