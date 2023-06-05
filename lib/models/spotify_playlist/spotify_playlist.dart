part of '../models.dart';

class SpotifyPlaylist {
  Track? track;

  SpotifyPlaylist({this.track});

  factory SpotifyPlaylist.fromJson(Map<String, dynamic> json) {
    return SpotifyPlaylist(
      track: json['track'] == null
          ? null
          : Track.fromJson(json['track'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'track': track?.toJson(),
      };
}
