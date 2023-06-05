import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExternalUrls extends Equatable {
  final String? spotify;

  const ExternalUrls({this.spotify});

  factory ExternalUrls.fromMap(Map<String, dynamic> data) => ExternalUrls(
        spotify: data['spotify'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'spotify': spotify,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExternalUrls].
  factory ExternalUrls.fromJson(String data) {
    return ExternalUrls.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExternalUrls] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [spotify];
}
