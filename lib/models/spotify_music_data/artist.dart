import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  const Artist({this.id, this.name, this.type, this.uri});

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json['id'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'uri': uri,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, type, uri];
}
