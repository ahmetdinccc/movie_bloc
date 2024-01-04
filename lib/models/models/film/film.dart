class Film {
  String? name;
  String avatar;
  String? contents;
  String? trailer;
  String? id;
  

  Film({
    required this.name,
    required this.avatar,
    required this.contents,
    required this.trailer,
    required this.id,
  });

  Film.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        avatar = json['avatar'],
        contents = json['contents'],
        trailer="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        id = json['id'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'contents': contents,
      'trailer':trailer,
      'id': id.toString(),
    };
  }
}













