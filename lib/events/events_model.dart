import 'package:geolocator/geolocator.dart';

class Event {
  String img;
  String title;
  List<String>? hosts;
  String description;
  bool isBookmarked;
  DateTime dateTime;
  Position? position;

  Event(
      {required this.img,
      required this.title,
      required this.description,
      this.hosts,
      this.isBookmarked = false,
      required this.dateTime,
      this.position});

  Map<String, dynamic> toJson() => {
        'img': img,
        'title': title,
        'hosts': hosts,
        'description': description,
        'isBookmarked': isBookmarked,
        'dateTime': dateTime,
        'position': position,
      };
  static fromJson(Map<String, dynamic> json) => Event(
      img: json['img'],
      title: json['title'],
      hosts: json['hosts'],
      description: json['description'],
      dateTime: json['dateTime'],
      position: json['position']);
}
