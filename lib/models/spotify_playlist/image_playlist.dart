class Image {
  int? height;
  String? url;
  int? width;

  Image({this.height, this.url, this.width});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json['height'] as int?,
        url: json['url'] as String?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'url': url,
        'width': width,
      };
}
