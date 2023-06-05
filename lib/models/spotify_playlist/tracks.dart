import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';

class Tracks extends Equatable {
  final String? href;
  final List<Item>? items;
  final int? limit;
  final dynamic next;
  final int? offset;
  final dynamic previous;
  final int? total;

  const Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Tracks.fromMap(Map<String, dynamic> data) => Tracks(
        href: data['href'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        limit: data['limit'] as int?,
        next: data['next'] as dynamic,
        offset: data['offset'] as int?,
        previous: data['previous'] as dynamic,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
        'items': items?.map((e) => e.toMap()).toList(),
        'limit': limit,
        'next': next,
        'offset': offset,
        'previous': previous,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tracks].
  factory Tracks.fromJson(String data) {
    return Tracks.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tracks] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      href,
      items,
      limit,
      next,
      offset,
      previous,
      total,
    ];
  }
}
