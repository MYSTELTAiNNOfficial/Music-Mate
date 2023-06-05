import 'image_playlist.dart';

class Album {
  List<Image>? images;

  Album({this.images});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'images': images?.map((e) => e.toJson()).toList(),
      };
}
