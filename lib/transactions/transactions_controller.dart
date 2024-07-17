import 'package:get/get.dart';
import 'package:gtp_app/transactions/transactions_model.dart';
import 'package:gtp_app/videoplayer/videomodel.dart';

class TransactionsController extends GetxController {
  Future<List<TransactionModel>>? transactionsList;
  late int? length = 0;
  Future<void> fetchData() async {
    Future.delayed(Duration(seconds: 2), () async {
      transactionsList = MockData.getTransactionsData();
      List<TransactionModel>? data = await transactionsList;
      length = data!.length;
      update();
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
