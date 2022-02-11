class ContestsResponse {
  String? title;
  String? description;
  List<ContestsLeague>? contestsLeagueList;

  ContestsResponse({this.title, this.description, this.contestsLeagueList});
}

class ContestsLeague {
  String? contestsId;
  String? entryFees;
  String? totalTeam;
  String? remainingTeam;
  String? totalWinner;
  int? createdTime;
  String? updatedTime;
  bool? isDelete;
  bool? isActive;
  bool? isFull;
  bool? isRefund;
  String? isResult;
  String? totalWiningAmount;

  ContestsLeague(
      {this.contestsId,
      this.entryFees,
      this.totalTeam,
      this.remainingTeam,
      this.totalWinner,
      this.createdTime = 0,
      this.updatedTime,
      this.isDelete,
      this.isActive,
      this.isFull,
      this.isRefund,
      this.isResult,
      this.totalWiningAmount});
}
