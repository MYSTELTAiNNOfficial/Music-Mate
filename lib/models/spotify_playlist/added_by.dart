import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_urls.dart';

class AddedBy extends Equatable {
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? type;
  final String? uri;

  const AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory AddedBy.fromMap(Map<String, dynamic> data) => AddedBy(
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
        'external_urls': externalUrls?.toMap(),
        'href': href,
        'id': id,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddedBy].
  factory AddedBy.fromJson(String data) {
    return AddedBy.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddedBy] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, href, id, type, uri];
}
