import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'artist.dart';
import 'external_urls.dart';
import 'image.dart';

class Album extends Equatable {
  final String? albumType;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  const Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromMap(Map<String, dynamic> data) => Album(
        albumType: data['album_type'] as String?,
        artists: (data['artists'] as List<dynamic>?)
            ?.map((e) => Artist.fromMap(e as Map<String, dynamic>))
            .toList(),
        availableMarkets: data['available_markets'] as List<String>?,
        externalUrls: data['external_urls'] == null
            ? null
            : ExternalUrls.fromMap(
                data['external_urls'] as Map<String, dynamic>),
        href: data['href'] as String?,
        id: data['id'] as String?,
        images: (data['images'] as List<dynamic>?)
            ?.map((e) => Image.fromMap(e as Map<String, dynamic>))
            .toList(),
        name: data['name'] as String?,
        releaseDate: data['release_date'] as String?,
        releaseDatePrecision: data['release_date_precision'] as String?,
        totalTracks: data['total_tracks'] as int?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'album_type': albumType,
        'artists': artists?.map((e) => e.toMap()).toList(),
        'available_markets': availableMarkets,
        'external_urls': externalUrls?.toMap(),
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toMap()).toList(),
        'name': name,
        'release_date': releaseDate,
        'release_date_precision': releaseDatePrecision,
        'total_tracks': totalTracks,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Album].
  factory Album.fromJson(String data) {
    return Album.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Album] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      albumType,
      artists,
      availableMarkets,
      externalUrls,
      href,
      id,
      images,
      name,
      releaseDate,
      releaseDatePrecision,
      totalTracks,
      type,
      uri,
    ];
  }
}
