import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../clipper/create_team.dart';

class ContestsWidget extends StatelessWidget {
  const ContestsWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getPriceList(context),
                      SizedBox(height: 10),
                      progressBar(),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(flex: 2, child: Text("Only 400 Spots left")),
                          Text("Upto 1500 Entries")
                        ],
                      ),
                    ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(15)),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text("5 Lakh"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("69%"),
                      ],
                    ),
                  ),
                  Text("Guaranteed",style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: Colors.green),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  progressBar() {
    var totalTeam = int.tryParse('12');
    var remainingTeam = int.tryParse('0');
    var per = (((totalTeam! - remainingTeam!) * 100) / totalTeam);
    return Container(
        height: 10,
        child: LinearGradientProgressbarView(progressbarPoint: per));
  }

  getPriceList(BuildContext context) {
    var remainingTeam = int.tryParse('9') ?? 0;
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Container(
                    child: Text('Prize Pool',
                        style: TextStyle(color: Colors.black54))),
                SizedBox(height: 4),
                Text('1000',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ])),
          GestureDetector(
              onTap: () => {},
              child: Column(children: <Widget>[
                Text('Winners', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 4),
                Text('1', style: TextStyle(color: Colors.blue))
              ])),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                Text('Entry',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.end),
                SizedBox(height: 8),
                remainingTeam != 0
                    ? Container(
                        height: 30,
                        width: 70,

                        decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: new BorderRadius.circular(20.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 0))
                            ]),
                        child: InkWell(
                                borderRadius: new BorderRadius.circular(4.0),
                                onTap: remainingTeam != 0
                                    ? () =>
                                        inviteCodeDialog(context, '200', '200')
                                    : null,
                                child: Center(
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                      Text('500',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .cardColor))
                                    ]))))
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[Text('00')])
              ]))
        ]));
  }

  winnerCount() {
    return InkWell(onTap: () {}, child: Container());
  }
}

void inviteCodeDialog(BuildContext context, String entryFee, String balance) {
  var cashBonus = '';
  var unutilizedBalanceWinning =
      '${(double.tryParse(balance)! + double.tryParse(balance)!).toStringAsFixed(2)}';

  if ((double.tryParse(entryFee)! * 0.20) < double.tryParse(balance)!) {
    cashBonus = '${double.tryParse(entryFee)! * 0.20}';
  } else {
    cashBonus = '${double.tryParse(balance)}';
  }
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext buildContext) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        color: Colors.white,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                          Text('CONFIRMATION',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          Text(
                                              'Unutilized Balance + Winning = ₹$unutilizedBalanceWinning',
                                              style: TextStyle(
                                                  color: Colors.black54))
                                        ])),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(LineIcons.windowClose,
                                            size: 20, color: Colors.red))
                                  ])),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Entry',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                    Text('₹$entryFee')
                                  ])),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Usable Cash Bonus',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                    Text('-₹$cashBonus')
                                  ])),
                          Divider(height: 1),
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 8, left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('To Pay',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                    Text(
                                        '₹${(double.tryParse(entryFee)! - double.tryParse(cashBonus)!).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green))
                                  ])),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Text(
                                  "By joining this contest, you accept FansyApp's T&C.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black54))),
                          Container(
                              height: 45,
                              child: Row(children: <Widget>[
                                Flexible(
                                    child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.red),
                                        child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        4.0),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: Center(
                                                    child: Text('JOIN CONTEST',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .white)))))))
                              ]))
                        ])))));
      });
}

class LinearGradientProgressbarView extends StatelessWidget {
  final double progressbarPoint;

  const LinearGradientProgressbarView({Key? key, this.progressbarPoint = 0.0})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        child:
            Stack(alignment: AlignmentDirectional.centerEnd, children: <Widget>[
      Container(
        height: 80,
        child: ClipPath(
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                  Colors.yellow,
                  Colors.red.withOpacity(0.5)
                ])))),
      ),
      Container(
          height: 80,
          child: ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              child: Container(
                  width: ((MediaQuery.of(context).size.width - 32) *
                      (100 - progressbarPoint) /
                      100),
                  color: HexColor('#ECECEC'))))
    ]));
  }
}
