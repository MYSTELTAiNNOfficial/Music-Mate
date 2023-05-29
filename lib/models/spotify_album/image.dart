import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final int? height;
  final String? url;
  final int? width;

  const Image({this.height, this.url, this.width});

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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [height, url, width];
}
