import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/team.dart';
import '../widget/play_card.dart';

class PlayScreen extends StatefulWidget {
  static final route = './play_screen';
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  double over = 0;
  int out = 0;

  String perBall = "hallo";

  void activity() async {
    int num = Random().nextInt(9);

    if (num > 0 && num <= 4 || num == 6) {
      perBall = "${num}";
      Provider.of<Teams>(context, listen: false).updateBalling("${num}", num);
      Provider.of<Teams>(context, listen: false).plusTotal(num);
    } else if (num == 0) {
      perBall = "bit";
      Provider.of<Teams>(context, listen: false)
          .updateBalling("bit", "dart Ball");
    } else if (num == 5) {
      perBall = "noBall";
      Provider.of<Teams>(context, listen: false)
          .updateBalling("noBall", "No Ball");
    } else if (num == 7) {
      perBall = "wide";
      Provider.of<Teams>(context, listen: false)
          .updateBalling("wide", "Wide Ball");
      Provider.of<Teams>(context, listen: false).plusTotal(1);
    } else if (num == 8) {
      print("out");
    }

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    final match = Provider.of<Teams>(context, listen: false).info;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Match Status : ${match["total"].toString()} / ${out}"),
              Text("overs ${over}")
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(13),
            child: GridView(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 7,
                  childAspectRatio: 1),
              children: [
                InkWell(
                  onTap: () {
                    activity();
                    print("1");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("2");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("3");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("4");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("6");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("1");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("1");
                  },
                  child: PlayCard(perBall),
                ),
                InkWell(
                  onTap: () {
                    activity();
                    print("1");
                  },
                  child: PlayCard(perBall),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
