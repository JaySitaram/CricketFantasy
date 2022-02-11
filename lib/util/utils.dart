import 'dart:async';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:flutter/material.dart';

class Utils {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  static void showToast(BuildContext context, String message) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context)!.insert(_overlayEntry!);
      toastTimer = Timer(Duration(milliseconds: 600), () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
        builder: (context) => Center(
            child: Align(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.black12,
                        child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Text(message)))))));
  }

  getHours(CricketScheduleResponse? cricketModel){
    var hours = cricketModel!.timeStart!
        .difference(DateTime.now())
        .inHours
        .toString();
    var minutes = cricketModel.timeStart!
        .difference(DateTime.now())
        .inMinutes
        .toString();

    if(int.parse(minutes)>0 && int.parse(hours)>0){
      if (minutes.length > 2) {
        minutes = minutes.substring(0, minutes.length - 2);
      }
      return '$hours:$minutes:00';
    }
    else{
      return '00:00:00';
    }
  }
}
