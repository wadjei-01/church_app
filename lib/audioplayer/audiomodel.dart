class Audio {
  String title;
  String img;
  String url;
  String description;
  int likes;
  int dislikes;
  DateTime dateTime;

  Audio(
      {required this.title,
      required this.img,
      required this.url,
      required this.likes,
      required this.dislikes,
      required this.description,
      required this.dateTime});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'likes': likes,
        'dislikes': dislikes,
        'img': img,
        'dateTime': dateTime,
      };

  static Audio fromJson(Map<String, dynamic> json) => Audio(
        title: json['title'],
        description: json['description'],
        likes: json['likes'],
        dislikes: json['dislikes'],
        img: json['img'],
        url: json['url'],
        dateTime: json['dateTime'],
      );
}
