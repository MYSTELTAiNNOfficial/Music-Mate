import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExternalIds extends Equatable {
  final String? isrc;

  const ExternalIds({this.isrc});

  factory ExternalIds.fromMap(Map<String, dynamic> data) => ExternalIds(
        isrc: data['isrc'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'isrc': isrc,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExternalIds].
  factory ExternalIds.fromJson(String data) {
    return ExternalIds.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExternalIds] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isrc];
}
