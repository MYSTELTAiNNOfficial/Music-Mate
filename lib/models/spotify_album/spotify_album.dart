part of '../models.dart';

class SpotifyAlbum extends Equatable {
  final String? albumType;
  final List<artist1.Artist>? artists;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  const SpotifyAlbum({
    this.albumType,
    this.artists,
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

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) => SpotifyAlbum(
        albumType: json['album_type'] as String?,
        artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => artist1.Artist.fromJson(e as Map<String, dynamic>))
            .toList(),
        href: json['href'] as String?,
        id: json['id'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        releaseDate: json['release_date'] as String?,
        releaseDatePrecision: json['release_date_precision'] as String?,
        totalTracks: json['total_tracks'] as int?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'album_type': albumType,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'name': name,
        'release_date': releaseDate,
        'release_date_precision': releaseDatePrecision,
        'total_tracks': totalTracks,
        'type': type,
        'uri': uri,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      albumType,
      artists,
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
