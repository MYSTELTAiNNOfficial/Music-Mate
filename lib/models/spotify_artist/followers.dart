import 'dart:convert';

import 'package:equatable/equatable.dart';

class Followers extends Equatable {
  final String? href;
  final int? total;

  const Followers({this.href, this.total});

  factory Followers.fromMap(Map<String, dynamic> data) => Followers(
        href: data['href'] as String?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'href': href,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Followers].
  factory Followers.fromJson(String data) {
    return Followers.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Followers] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href, total];
}
