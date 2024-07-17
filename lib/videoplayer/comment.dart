class Comment {
  String text;
  String profileIcon;
  String profileName;

  Comment(
      {required this.text,
      required this.profileIcon,
      required this.profileName});

  Map<String, dynamic> toJson() => {
        'text': text,
        'profileIcon': profileIcon,
        'profileName': profileName,
      };

  static Comment fromJson(Map<String, dynamic> json) => Comment(
      text: json['text'],
      profileIcon: json['profileIcon'],
      profileName: json['profileName']);
}
