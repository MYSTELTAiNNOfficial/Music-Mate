import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoThumbnail extends Equatable {
  final dynamic url;

  const VideoThumbnail({this.url});

  factory VideoThumbnail.fromMap(Map<String, dynamic> data) {
    return VideoThumbnail(
      url: data['url'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideoThumbnail].
  factory VideoThumbnail.fromJson(String data) {
    return VideoThumbnail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideoThumbnail] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url];
}
