import 'dart:convert';

import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final dynamic height;
  final String? url;
  final dynamic width;

  const Image({this.height, this.url, this.width});

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        height: data['height'] as dynamic,
        url: data['url'] as String?,
        width: data['width'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'height': height,
        'url': url,
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
  List<Object?> get props => [height, url, width];
}
