class ItemDetail {
  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  ItemDetail({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  ItemDetail copyWith({
    String? apiDetailUrl,
    int? id,
    String? name,
    String? siteDetailUrl,
  }) =>
      ItemDetail(
        apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        id: id ?? this.id,
        name: name ?? this.name,
        siteDetailUrl: siteDetailUrl ?? this.siteDetailUrl,
      );

  factory ItemDetail.fromJson(Map<String, dynamic> json) => ItemDetail(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}
