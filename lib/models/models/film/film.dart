class Film {
  String? name;
  String avatar;
  String? contents;
  String? id;

  Film({
    required this.name,
    required this.avatar,
    required this.contents,
    required this.id,
  });

  Film.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        avatar = json['avatar'],
        contents = json['contents'],
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'contents': contents,
      'id': id.toString(),
    };
  }
}













