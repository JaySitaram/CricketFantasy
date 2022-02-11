import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class SelectedIdModel{
  int? id;
  SelectedIdModel({this.id});
}

SelectedIdModel selectedIdModel=SelectedIdModel();

class CricketScheduleResponse {
  String? match;
  int? competitionId;
  String? seriesName;
  String? dateStart;
  DateTime? timeStart;
  String? umpires;
  String? teamName1;
  String? teamName2;
  String? teamLogo1;
  String? teamLogo2;
  String? referee;
  String? venue;
  String? isTapped;
  String? location;
  String? matchFormat;
  TeamLogo? teamLogo;

  CricketScheduleResponse(
      {this.match,
      this.competitionId,
      this.seriesName,
      this.dateStart,
      this.isTapped,
      this.timeStart,
      this.umpires,
      this.referee,
      this.venue,
      this.teamName1,
      this.teamName2,
      this.teamLogo1,
      this.teamLogo2,
      this.matchFormat,
      this.location,
      this.teamLogo});
}

class TeamLogo {
  A? a;
  B? b;

  TeamLogo({this.a, this.b});
}

class A {
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;

  A({this.teamId, this.name, this.shortName, this.logoUrl});
}

class B {
  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;

  B({this.teamId, this.name, this.shortName, this.logoUrl});
}

List<CricketScheduleResponse> responseString=[
  CricketScheduleResponse(
    venue: "Ahemdabad",
    competitionId: 1,
    teamLogo1: rcbLogo,
    teamLogo2: kkrlogo,
    teamName1: "RCB",
    teamName2: "KKR",
    match: "Online",
    seriesName: "DREAM11 IPL 2022",
    matchFormat: "20-20",
    timeStart: DateTime(2022, 02, 12, 16, 30),
    location: "Narendra Modi Stadium,Ahemdabad",
  ),
  CricketScheduleResponse(
    venue: "Chennai",
    competitionId: 2,
    teamLogo1: csklogo,
    teamLogo2: milogo,
    teamName1: "CSK",
    teamName2: "MI",
    match: "Online",
    seriesName: "DREAM11 IPL 2022",
    matchFormat: "20-20",
    timeStart:  DateTime(2022, 02, 12, 19, 30),
    location: "Chinna Swami Stadium,Chennai",
  ),
  CricketScheduleResponse(
    venue: "Rajasthan",
    competitionId: 3,
    teamLogo1: pbkslogo,
    teamLogo2: rrlogo,
    teamName1: "PBKS",
    teamName2: "RR",
    match: "Online",
    seriesName: "DREAM11 IPL 2022",
    matchFormat: "20-20",
    timeStart: DateTime(2022, 02, 13, 16, 30),
    location: "Sawai Mansing Stadium,Rajasthan",
  ),
  CricketScheduleResponse(
    venue: "Rajasthan",
    competitionId: 4,
    teamLogo1: srhlogo,
    teamLogo2: dclogo,
    teamName1: "SRH",
    teamName2: "DC",
    match: "Online",
    seriesName: "DREAM11 IPL 2022",
    matchFormat: "20-20",
    timeStart: DateTime(2022, 02, 13, 19, 30),
    location: "Atal Stadium,Delhi",
  ),
];

Map rcbPlayers={
  "RCB":[
    {"Batsman":"V Kohli"},
    {"Batsman":"AB Devillers"},
    {"Batsman":"D Pudikkel"},
    {"Batsman":"G Maxwell"},
    {"Batsman":"S Khan"},
    {"WK":"K Bharat"},
    {"All Rounder":"D Cristian"},
    {"Bowler":"A Zampa"},
    {"Bowler":"H Patel"},
    {"Bowler":"Y Chahal"},
    {"Bowler":"M Siraj"},
  ]
};

Map kkrPlayers={
  "KKR":[
    {"Batsman":"S Gill"},
    {"Batsman":"V Iyer"},
    {"Batsman":"R Tripathi"},
    {"Batsman":"E Morgen"},
    {"Batsman":"S Jackson"},
    {"WK":"D Kartik"},
    {"All Rounder":"A Russel"},
    {"Bowler":"S Narine"},
    {"Bowler":"P Krishna"},
    {"Bowler":"S Mavi"},
    {"Bowler":"P Kummins"},
  ]
};

Map cskPlayers={
  "CSK":[
    {"Batsman":"F Plasis"},
    {"Batsman":"S Raina"},
    {"Batsman":"M Ali"},
    {"Batsman":"R Gaikwad"},
    {"All Rounder":"DJ Bravo"},
    {"WK":"MS Dhoni"},
    {"All Rounder":"R Jadeja"},
    {"Bowler":"D Chahar"},
    {"Bowler":"S Thakur"},
    {"Bowler":"J Hazelwood"},
    {"Bowler":"K Sharma"},
  ]
};

Map miPlayers={
  "MI":[
    {"Batsman":"R Sharma"},
    {"Batsman":"S Yadav"},
    {"Batsman":"I Kishan"},
    {"Batsman":"K Pollard"},
    {"All Rounder":"K Pandya"},
    {"WK":"Q De Cock"},
    {"All Rounder":"H Pandya"},
    {"Bowler":"J Bumrah"},
    {"Bowler":"R Chahar"},
    {"Bowler":"T Boult"},
    {"Bowler":"J Yadav"},
  ]
};

Map dcPlayers={
  "DC":[
    {"Batsman":"S Dhawan"},
    {"Batsman":"S Iyer"},
    {"Batsman":"P Shaw"},
    {"Batsman":"S Smith"},
    {"All Rounder":"R Ashwin"},
    {"WK":"R Pant"},
    {"All Rounder":"M Stoinis"},
    {"Bowler":"K Rabada"},
    {"Bowler":"A Patel"},
    {"Bowler":"A Nortje"},
    {"Bowler":"A Khan"},
  ]
};

Map srhPlayers={
  "SRH":[
    {"Batsman":"K Williamson"},
    {"Batsman":"J Roy"},
    {"Batsman":"M Pandey"},
    {"Batsman":"A Samad"},
    {"Batsman":"P Garg"},
    {"WK":"J Bairstow"},
    {"All Rounder":"M Marsh"},
    {"Bowler":"B Kumar"},
    {"Bowler":"S Sharma"},
    {"Bowler":"R Khan"},
    {"Bowler":"U Malik"},
  ]
};

Map rrPlayers={
  "RR":[
    {"Batsman":"S Samson"},
    {"Batsman":"J Buttler"},
    {"Batsman":"L Livingstone"},
    {"Batsman":"Y Jaiswal"},
    {"All Rounder":"R Tewatia"},
    {"WK":"S Samson"},
    {"All Rounder":"B Stokes"},
    {"Bowler":"C Morris"},
    {"Bowler":"K Tyagi"},
    {"Bowler":"S Gopal"},
    {"Bowler":"C Sharma"},
  ]
};

Map pbksPlayers={
  "PBKS":[
    {"Batsman":"M Agrawal"},
    {"Batsman":"N Pooran"},
    {"Batsman":"C Gayle"},
    {"Batsman":"D Malan"},
    {"All Rounder":"D Hooda"},
    {"WK":"KL Rahul"},
    {"All Rounder":"M Hendricks"},
    {"Bowler":"R Bishnoi"},
    {"Bowler":"C Jordon"},
    {"Bowler":"A Singh"},
    {"Bowler":"M Shami"},
  ]
};


