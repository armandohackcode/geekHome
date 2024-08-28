class ComicImage {
  String iconUrl;
  String mediumUrl;
  String screenUrl;
  String screenLargeUrl;
  String smallUrl;
  String superUrl;
  String thumbUrl;
  String tinyUrl;
  String originalUrl;
  ImageTags imageTags;

  ComicImage({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  ComicImage copyWith({
    String? iconUrl,
    String? mediumUrl,
    String? screenUrl,
    String? screenLargeUrl,
    String? smallUrl,
    String? superUrl,
    String? thumbUrl,
    String? tinyUrl,
    String? originalUrl,
    ImageTags? imageTags,
  }) =>
      ComicImage(
        iconUrl: iconUrl ?? this.iconUrl,
        mediumUrl: mediumUrl ?? this.mediumUrl,
        screenUrl: screenUrl ?? this.screenUrl,
        screenLargeUrl: screenLargeUrl ?? this.screenLargeUrl,
        smallUrl: smallUrl ?? this.smallUrl,
        superUrl: superUrl ?? this.superUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        tinyUrl: tinyUrl ?? this.tinyUrl,
        originalUrl: originalUrl ?? this.originalUrl,
        imageTags: imageTags ?? this.imageTags,
      );

  factory ComicImage.fromJson(Map<String, dynamic> json) => ComicImage(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: imageTagsValues.map[json["image_tags"]]!,
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

enum ImageTags { allImages }

final imageTagsValues = EnumValues({"All Images": ImageTags.allImages});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
