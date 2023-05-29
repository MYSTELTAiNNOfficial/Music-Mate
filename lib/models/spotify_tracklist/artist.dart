import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  const Artist({this.href, this.id, this.name, this.type, this.uri});

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        href: json['href'] as String?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'id': id,
        'name': name,
        'type': type,
        'uri': uri,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href, id, name, type, uri];
}
