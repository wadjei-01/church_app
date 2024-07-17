import 'package:gtp_app/audioplayer/audiomodel.dart';
import 'package:gtp_app/events/events_model.dart';
import 'package:gtp_app/transactions/transactions_model.dart';
import 'package:gtp_app/videoplayer/comment.dart';

class Video {
  String title;
  String img;
  String url;
  String description;
  int views;
  int likes;
  int dislikes;
  List<Comment> commentsList;
  DateTime dateTime;

  Video(
      {required this.title,
      required this.img,
      required this.url,
      required this.views,
      required this.likes,
      required this.dislikes,
      required this.commentsList,
      required this.description,
      required this.dateTime});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'views': views,
        'likes': likes,
        'dislikes': dislikes,
        'comments': commentsList,
        'img': img,
        'dateTime': dateTime,
      };

  static Video fromJson(Map<String, dynamic> json) => Video(
        title: json['title'],
        description: json['description'],
        views: json['views'],
        likes: json['likes'],
        dislikes: json['dislikes'],
        commentsList: json['commentsList'],
        img: json['img'],
        url: json['url'],
        dateTime: json['dateTime'],
      );
}

class MockData {
  static Future<List<Video>> fetchVideoData() async {
    var data = [
      Video(
          title: "Feast of Tabernacles",
          img: 'assets/img/videoSample.jpg',
          views: 10,
          likes: 30,
          dislikes: 10,
          commentsList: [
            Comment(
                profileIcon: "assets/img/videoSample.jpg",
                profileName: "Frank Phillo",
                text: "Well done Pastor, keep it up!"),
          ],
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 3, 2)),
      Video(
          title: "Feast of Tabernacles Day 2",
          img: 'assets/img/videoSample2.jpg',
          views: 2000,
          likes: 300,
          dislikes: 3,
          commentsList: [
            Comment(
                profileIcon: "assets/img/videoSample3.jpg",
                profileName: "Frank Phil",
                text: "Well done Pastor, keep it up!"),
          ],
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 3, 1)),
      Video(
          title: "Feast of Tabernacles Day 3",
          img: 'assets/img/videoSample3.jpg',
          views: 200000,
          likes: 500,
          dislikes: 1,
          commentsList: [
            Comment(
                profileIcon: "assets/img/videoSample3.jpg",
                profileName: "Frank Phil",
                text:
                    "I'm using Get package for state management and I also use Get.bottomSheet() command. I want to close the sheet and I know I can use Navigator.pop() but in this example:"),
            Comment(
                profileIcon: "assets/img/videoSample2.jpg",
                profileName: "Frank Phil",
                text: "Great Sermon!!"),
            Comment(
                profileIcon: "assets/img/videoSample.jpg",
                profileName: "Frank Phil",
                text: "Eii Pastor")
          ],
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 2, 2)),
    ];

    return data;
  }

  static Future<List<Audio>> fetchAudioData() async {
    var data = [
      Audio(
          title: "Feast of Tabernacles",
          img: 'assets/img/videoSample.jpg',
          likes: 30,
          dislikes: 10,
          url: 'https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 3, 2)),
      Audio(
          title: "Feast of Tabernacles Day 2",
          img: 'assets/img/videoSample2.jpg',
          likes: 300,
          dislikes: 3,
          url: 'https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 3, 1)),
      Audio(
          title: "Feast of Tabernacles Day 3",
          img: 'assets/img/videoSample3.jpg',
          likes: 500,
          dislikes: 1,
          url: 'https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac',
          description: "Lorem ipsum",
          dateTime: DateTime(2023, 2, 2)),
    ];

    return data;
  }

  static Future<List<Event>> fetchEventData() async {
    var data = [
      Event(
          img: 'assets/img/sample.png',
          title: 'Feast of Tabernacles',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          dateTime: DateTime(2023, 07, 23)),
      Event(
          img: 'assets/img/videoSample2.jpg',
          title: 'Communion Service',
          description: 'Event of The Yearrr',
          dateTime: DateTime(2023, 07, 30)),
      Event(
          img: 'assets/img/videoSample.jpg',
          title: 'Thanksgiving',
          description: 'Event of The Yearrr',
          dateTime: DateTime(2023, 07, 31)),
    ];
    return data;
  }

  static Future<List<TransactionModel>> getTransactionsData() async {
    var data = [
      TransactionModel(
          amountPaid: 500,
          msg: "Offering",
          phoneNumber: '0550239005',
          vendorImage: 'assets/img/mtn.png',
          dateTime: DateTime(2023, 2, 2),
          isSuccessful: true),
      TransactionModel(
          amountPaid: 200,
          msg: "Thank you Lord!",
          phoneNumber: '0550239005',
          vendorImage: 'assets/img/mtn.png',
          dateTime: DateTime(2023, 2, 12),
          isSuccessful: true),
      TransactionModel(
          amountPaid: 250,
          msg: "Thanksgiving Offering",
          phoneNumber: '0541553474',
          vendorImage: 'assets/img/absa.png',
          dateTime: DateTime(2020, 12, 1),
          isSuccessful: false),
    ];
    return data;
  }
}

enum Status {
  pending,
  failed,
  successful,
}
