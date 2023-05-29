import 'package:equatable/equatable.dart';

import 'album.dart';
import 'artist.dart';

class SpotifyMusicData extends Equatable {
  final Album? album;
  final List<Artist>? artists;
  final int? discNumber;
  final int? durationMs;
  final String? id;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;

  const SpotifyMusicData({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.id,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory SpotifyMusicData.fromJson(Map<String, dynamic> json) {
    return SpotifyMusicData(
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: json['disc_number'] as int?,
      durationMs: json['duration_ms'] as int?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      popularity: json['popularity'] as int?,
      previewUrl: json['preview_url'] as String?,
      trackNumber: json['track_number'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'album': album?.toJson(),
        'artists': artists?.map((e) => e.toJson()).toList(),
        'disc_number': discNumber,
        'duration_ms': durationMs,
        'id': id,
        'name': name,
        'popularity': popularity,
        'preview_url': previewUrl,
        'track_number': trackNumber,
        'type': type,
        'uri': uri,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      album,
      artists,
      discNumber,
      durationMs,
      id,
      name,
      popularity,
      previewUrl,
      trackNumber,
      type,
      uri,
    ];
  }
}
