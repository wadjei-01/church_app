class TransactionModel {
  double amountPaid;
  String msg;
  String phoneNumber;
  String vendorImage;
  DateTime dateTime;
  bool isSuccessful;

  TransactionModel(
      {required this.amountPaid,
      required this.msg,
      required this.phoneNumber,
      required this.vendorImage,
      required this.dateTime,
      required this.isSuccessful});

  Map<String, dynamic> toJson() => {
        'amountPaid': amountPaid,
        'msg': msg,
        'phoneNumber': phoneNumber,
        'vendorImage': vendorImage,
        'dateTime': dateTime,
        'isSuccessful': isSuccessful,
      };

  static TransactionModel fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          amountPaid: json['amountPaid'],
          msg: json['msg'],
          phoneNumber: json['phoneNumber'],
          vendorImage: json['vendorImage'],
          dateTime: json['dateTime'],
          isSuccessful: json['isSuccessful']);
}
