import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_urls.dart';

class Owner extends Equatable {
  final String? displayName;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;

  const Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromMap(Map<String, dynamic> data) => Owner(
        displayName: data['display_name'] as String?,
        externalUrls: data['external_urls'] == null
            ? null
            : ExternalUrls.fromMap(
                data['external_urls'] as Map<String, dynamic>),
        href: data['href'] as String?,
        id: data['id'] as String?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'display_name': displayName,
        'external_urls': externalUrls?.toMap(),
        'href': href,
        'id': id,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Owner].
  factory Owner.fromJson(String data) {
    return Owner.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Owner] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      displayName,
      externalUrls,
      href,
      id,
      type,
      uri,
    ];
  }
}
