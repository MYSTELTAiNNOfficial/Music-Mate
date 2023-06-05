import 'album_playlist.dart';
import 'artist_playlist.dart';

class Track {
  Album? album;
  List<Artist>? artists;
  int? discNumber;
  int? durationMs;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  bool? track;
  int? trackNumber;
  String? type;
  String? uri;

  Track({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: json['album'] == null
            ? null
            : Album.fromJson(json['album'] as Map<String, dynamic>),
        artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
            .toList(),
        discNumber: json['disc_number'] as int?,
        durationMs: json['duration_ms'] as int?,
        id: json['id'] as String?,
        isLocal: json['is_local'] as bool?,
        name: json['name'] as String?,
        popularity: json['popularity'] as int?,
        track: json['track'] as bool?,
        trackNumber: json['track_number'] as int?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'album': album?.toJson(),
        'artists': artists?.map((e) => e.toJson()).toList(),
        'disc_number': discNumber,
        'duration_ms': durationMs,
        'id': id,
        'is_local': isLocal,
        'name': name,
        'popularity': popularity,
        'track': track,
        'track_number': trackNumber,
        'type': type,
        'uri': uri,
      };
}
