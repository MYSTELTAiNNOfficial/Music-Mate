import 'dart:convert';

import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? url;
  final int? height;
  final int? width;

  const Image({this.url, this.height, this.width});

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        url: data['url'] as String?,
        height: data['height'] as int?,
        width: data['width'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'height': height,
        'width': width,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, height, width];
}
