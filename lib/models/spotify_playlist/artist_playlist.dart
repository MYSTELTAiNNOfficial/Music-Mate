class Artist {
  String? id;
  String? name;
  String? type;
  String? uri;

  Artist({this.id, this.name, this.type, this.uri});

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
}
