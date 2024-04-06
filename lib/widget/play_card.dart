import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/team.dart';

class PlayCard extends StatelessWidget {


  String perBall = "hallo";

  void activity() async {
    int num = Random().nextInt(9);

    if (num > 0 && num <= 4 || num == 6) {
      perBall = "${num}";
      UpdateMutation("${num}", num);
      AddTotalMutation(num);
      // Provider.of<TeamsModel>(context, listen: false).updateBalling("${num}", num);
      // Provider.of<TeamsModel>(context, listen: false).plusTotal(num);
    } else if (num == 0) {
      perBall = "bit";
      UpdateMutation("bit", "dart Ball");
      // Provider.of<TeamsModel>(context, listen: false).updateBalling("bit", "dart Ball");
    } else if (num == 5) {
      perBall = "noBall";
      UpdateMutation("noBall", "No Ball");
      // Provider.of<TeamsModel>(context, listen: false)
      //     .updateBalling("noBall", "No Ball");
    } else if (num == 7) {
      perBall = "wide";
      UpdateMutation("wide", "Wide Ball");
      AddTotalMutation(1);
      // Provider.of<TeamsModel>(context, listen: false)
      //     .updateBalling("wide", "Wide Ball");
      // Provider.of<TeamsModel>(context, listen: false).plusTotal(1);
    } else if (num == 8) {
      print("out");
    }

    // setState(() {});

  }
  // void setMethod() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     // Provider.of<Teams>(context, listen: false).updateBallingToZero();
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    // setMethod();
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Card(
        color: Colors.cyanAccent,
        elevation: 15,
        child: Center(
          child: perBall != 0 &&
                  perBall != ""
              ? Text(
                  perBall.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : Text(""),
        ),
      ),
    );
  }
}
