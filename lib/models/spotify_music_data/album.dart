import 'package:equatable/equatable.dart';

import 'image.dart';

class Album extends Equatable {
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? uri;

  const Album({this.href, this.id, this.images, this.name, this.uri});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        href: json['href'] as String?,
        id: json['id'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'name': name,
        'uri': uri,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href, id, images, name, uri];
}
