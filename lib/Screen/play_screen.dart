import 'dart:async';
import 'dart:math';

import 'package:add_drop_product/core/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/team.dart';
import '../widget/play_card.dart';

class PlayScreen  {
  static final route = './play_screen';

  double over = 0;
  int out = 0;

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

  @override
  Widget build(BuildContext context) {
    final match = Provider.of<TeamsModel>(context, listen: false).info;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Play"),
        ),
      ),
      body: Column(
        children: [
          match["bat"] % 2 == 0
              ? Text("${match["team1"]} Batting")
              : Text("${match["team2"]} Batting"),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: GridView.builder(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 7,
                  childAspectRatio: 1,),
              itemBuilder: (ctx,index){
                return PlayCard(perBall);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MatchTitleBar extends StatelessWidget {
  final double overs;

  @override
  Widget build(BuildContext context) {
    final TeamsModel hittingBall = (VxState.store as MyStore).teams;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Match Status : ${hittingBall.info["total"].toString()} / ${out}"),
        Text("overs ${over}")
      ],
    ),
  }
}
