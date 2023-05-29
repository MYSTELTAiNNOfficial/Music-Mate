import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? url;
  final int? height;
  final int? width;

  const Image({this.url, this.height, this.width});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'] as String?,
        height: json['height'] as int?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'height': height,
        'width': width,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, height, width];
}
