import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'added_by.dart';
import 'track.dart';
import 'video_thumbnail.dart';

class Item extends Equatable {
  final String? addedAt;
  final AddedBy? addedBy;
  final bool? isLocal;
  final dynamic primaryColor;
  final Track? track;
  final VideoThumbnail? videoThumbnail;

  const Item({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        addedAt: data['added_at'] as String?,
        addedBy: data['added_by'] == null
            ? null
            : AddedBy.fromMap(data['added_by'] as Map<String, dynamic>),
        isLocal: data['is_local'] as bool?,
        primaryColor: data['primary_color'] as dynamic,
        track: data['track'] == null
            ? null
            : Track.fromMap(data['track'] as Map<String, dynamic>),
        videoThumbnail: data['video_thumbnail'] == null
            ? null
            : VideoThumbnail.fromMap(
                data['video_thumbnail'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'added_at': addedAt,
        'added_by': addedBy?.toMap(),
        'is_local': isLocal,
        'primary_color': primaryColor,
        'track': track?.toMap(),
        'video_thumbnail': videoThumbnail?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      addedAt,
      addedBy,
      isLocal,
      primaryColor,
      track,
      videoThumbnail,
    ];
  }
}
