class TransactionSection {
  List<TransactionResponse>? transactionList;
  String? date = '';

  TransactionSection({this.transactionList, this.date});
}

class TransactionResponse {
  String? transactionId;
  String? type;
  String? remark;
  String? amount;
  String? teamName;
  String? time;
  String? statusRequest;
  String? statusProcess;
  String? statusCredit;

  bool? isExpanded;

  TransactionResponse({
    this.transactionId,
    this.type,
    this.remark,
    this.amount,
    this.teamName,
    this.statusRequest,
    this.statusCredit,
    this.statusProcess,
    this.time,
    this.isExpanded = false,
  });
}
