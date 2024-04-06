import 'dart:async';
import 'dart:math';

import 'package:add_drop_product/core/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/team.dart';
import '../widget/play_card.dart';

class PlayScreen extends StatelessWidget {
  static final route = './play_screen';

  double over = 0;
  int out = 0;



  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Play"),
        ),
      ),
      body: Column(
        children: [
          teams.info["bat"] % 2 == 0
              ? Text("${teams.info['team1']} Batting")
              : Text("${teams.info["team2"]} Batting"),
          VxBuilder(
              mutations: {AddTotalMutation},
              builder:(context,__,_) => MatchTitleBar(overs: over,out: out,)),
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
                return PlayCard();
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
  final int out;

  const MatchTitleBar({super.key, required this.overs, required this.out});

  @override
  Widget build(BuildContext context) {
    final TeamsModel hittingBall = (VxState.store as MyStore).teams;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Match Status : ${hittingBall.info["total"].toString()} / ${out}"),
        Text("overs ${overs}")
      ],
    );
  }
}
