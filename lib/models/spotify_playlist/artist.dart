import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_urls.dart';

class Artist extends Equatable {
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  const Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromMap(Map<String, dynamic> data) => Artist(
        externalUrls: data['external_urls'] == null
            ? null
            : ExternalUrls.fromMap(
                data['external_urls'] as Map<String, dynamic>),
        href: data['href'] as String?,
        id: data['id'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'external_urls': externalUrls?.toMap(),
        'href': href,
        'id': id,
        'name': name,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Artist].
  factory Artist.fromJson(String data) {
    return Artist.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Artist] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, href, id, name, type, uri];
}
