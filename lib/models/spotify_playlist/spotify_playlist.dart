import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'external_urls.dart';
import 'followers.dart';
import 'image.dart';
import 'owner.dart';
import 'tracks.dart';

class SpotifyPlaylist extends Equatable {
  final bool? collaborative;
  final String? description;
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final Owner? owner;
  final String? primaryColor;
  final bool? public;
  final String? snapshotId;
  final Tracks? tracks;
  final String? type;
  final String? uri;

  const SpotifyPlaylist({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory SpotifyPlaylist.fromMap(Map<String, dynamic> data) {
    return SpotifyPlaylist(
      collaborative: data['collaborative'] as bool?,
      description: data['description'] as String?,
      externalUrls: data['external_urls'] == null
          ? null
          : ExternalUrls.fromMap(data['external_urls'] as Map<String, dynamic>),
      followers: data['followers'] == null
          ? null
          : Followers.fromMap(data['followers'] as Map<String, dynamic>),
      href: data['href'] as String?,
      id: data['id'] as String?,
      images: (data['images'] as List<dynamic>?)
          ?.map((e) => Image.fromMap(e as Map<String, dynamic>))
          .toList(),
      name: data['name'] as String?,
      owner: data['owner'] == null
          ? null
          : Owner.fromMap(data['owner'] as Map<String, dynamic>),
      primaryColor: data['primary_color'] as String?,
      public: data['public'] as bool?,
      snapshotId: data['snapshot_id'] as String?,
      tracks: data['tracks'] == null
          ? null
          : Tracks.fromMap(data['tracks'] as Map<String, dynamic>),
      type: data['type'] as String?,
      uri: data['uri'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'collaborative': collaborative,
        'description': description,
        'external_urls': externalUrls?.toMap(),
        'followers': followers?.toMap(),
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toMap()).toList(),
        'name': name,
        'owner': owner?.toMap(),
        'primary_color': primaryColor,
        'public': public,
        'snapshot_id': snapshotId,
        'tracks': tracks?.toMap(),
        'type': type,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpotifyPlaylist].
  factory SpotifyPlaylist.fromJson(String data) {
    return SpotifyPlaylist.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SpotifyPlaylist] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      collaborative,
      description,
      externalUrls,
      followers,
      href,
      id,
      images,
      name,
      owner,
      primaryColor,
      public,
      snapshotId,
      tracks,
      type,
      uri,
    ];
  }
}
