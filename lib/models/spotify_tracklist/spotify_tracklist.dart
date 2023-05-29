import 'package:equatable/equatable.dart';

import 'artist.dart';

class SpotifyTracklist extends Equatable {
  final List<Artist>? artists;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final String? href;
  final String? id;
  final bool? isLocal;
  final String? name;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;

  const SpotifyTracklist({
    this.artists,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory SpotifyTracklist.fromJson(Map<String, dynamic> json) {
    return SpotifyTracklist(
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      discNumber: json['disc_number'] as int?,
      durationMs: json['duration_ms'] as int?,
      explicit: json['explicit'] as bool?,
      href: json['href'] as String?,
      id: json['id'] as String?,
      isLocal: json['is_local'] as bool?,
      name: json['name'] as String?,
      previewUrl: json['preview_url'] as String?,
      trackNumber: json['track_number'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'artists': artists?.map((e) => e.toJson()).toList(),
        'disc_number': discNumber,
        'duration_ms': durationMs,
        'explicit': explicit,
        'href': href,
        'id': id,
        'is_local': isLocal,
        'name': name,
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
      artists,
      discNumber,
      durationMs,
      explicit,
      href,
      id,
      isLocal,
      name,
      previewUrl,
      trackNumber,
      type,
      uri,
    ];
  }
}
