import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_urls.dart';
import 'followers.dart';
import 'image.dart';

class SpotifyArtist extends Equatable {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final int? popularity;
  final String? type;
  final String? uri;

  const SpotifyArtist({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory SpotifyArtist.fromMap(Map<String, dynamic> data) => SpotifyArtist(
        externalUrls: data['external_urls'] == null
            ? null
            : ExternalUrls.fromMap(
                data['external_urls'] as Map<String, dynamic>),
        followers: data['followers'] == null
            ? null
            : Followers.fromMap(data['followers'] as Map<String, dynamic>),
        genres: data['genres'] as List<String>?,
        href: data['href'] as String?,
        id: data['id'] as String?,
        images: (data['images'] as List<dynamic>?)
            ?.map((e) => Image.fromMap(e as Map<String, dynamic>))
            .toList(),
        name: data['name'] as String?,
        popularity: data['popularity'] as int?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'external_urls': externalUrls?.toMap(),
        'followers': followers?.toMap(),
        'genres': genres,
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toMap()).toList(),
        'name': name,
        'popularity': popularity,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpotifyArtist].
  factory SpotifyArtist.fromJson(String data) {
    return SpotifyArtist.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpotifyArtist] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      externalUrls,
      followers,
      genres,
      href,
      id,
      images,
      name,
      popularity,
      type,
      uri,
    ];
  }
}
