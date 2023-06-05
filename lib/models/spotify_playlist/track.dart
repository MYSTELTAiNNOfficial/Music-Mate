import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'album.dart';
import 'artist.dart';
import 'external_ids.dart';
import 'external_urls.dart';

class Track extends Equatable {
  final Album? album;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? episode;
  final bool? explicit;
  final ExternalIds? externalIds;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isLocal;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final bool? track;
  final int? trackNumber;
  final String? type;
  final String? uri;

  const Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromMap(Map<String, dynamic> data) => Track(
        album: data['album'] == null
            ? null
            : Album.fromMap(data['album'] as Map<String, dynamic>),
        artists: (data['artists'] as List<dynamic>?)
            ?.map((e) => Artist.fromMap(e as Map<String, dynamic>))
            .toList(),
        availableMarkets: data['available_markets'] as List<String>?,
        discNumber: data['disc_number'] as int?,
        durationMs: data['duration_ms'] as int?,
        episode: data['episode'] as bool?,
        explicit: data['explicit'] as bool?,
        externalIds: data['external_ids'] == null
            ? null
            : ExternalIds.fromMap(data['external_ids'] as Map<String, dynamic>),
        externalUrls: data['external_urls'] == null
            ? null
            : ExternalUrls.fromMap(
                data['external_urls'] as Map<String, dynamic>),
        href: data['href'] as String?,
        id: data['id'] as String?,
        isLocal: data['is_local'] as bool?,
        name: data['name'] as String?,
        popularity: data['popularity'] as int?,
        previewUrl: data['preview_url'] as String?,
        track: data['track'] as bool?,
        trackNumber: data['track_number'] as int?,
        type: data['type'] as String?,
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'album': album?.toMap(),
        'artists': artists?.map((e) => e.toMap()).toList(),
        'available_markets': availableMarkets,
        'disc_number': discNumber,
        'duration_ms': durationMs,
        'episode': episode,
        'explicit': explicit,
        'external_ids': externalIds?.toMap(),
        'external_urls': externalUrls?.toMap(),
        'href': href,
        'id': id,
        'is_local': isLocal,
        'name': name,
        'popularity': popularity,
        'preview_url': previewUrl,
        'track': track,
        'track_number': trackNumber,
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Track].
  factory Track.fromJson(String data) {
    return Track.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Track] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      album,
      artists,
      availableMarkets,
      discNumber,
      durationMs,
      episode,
      explicit,
      externalIds,
      externalUrls,
      href,
      id,
      isLocal,
      name,
      popularity,
      previewUrl,
      track,
      trackNumber,
      type,
      uri,
    ];
  }
}
