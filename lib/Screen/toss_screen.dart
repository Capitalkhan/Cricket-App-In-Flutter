import 'package:add_drop_product/Screen/play_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../provider/team.dart';

class TossScreen extends StatefulWidget {
  static final route = './toss_route';

  @override
  State<TossScreen> createState() => _TossScreenState();
}

class _TossScreenState extends State<TossScreen> {
  int? num;
  String toss = "";

  void randomNum() {
    num = Random().nextInt(100);
    Provider.of<TeamsModel>(context, listen: false).update("bat",num);

    setState(() {
      if (num! % 2 == 0) {
        toss =
            "${Provider.of<TeamsModel>(context, listen: false).info["team1"].toString()} Win The Toss";
      } else {
        toss =
            "${Provider.of<TeamsModel>(context, listen: false).info["team2"].toString()} Win The Toss";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final match = Provider.of<TeamsModel>(context).info;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Toss Time"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              splashColor: Colors.white,
              onTap: () => randomNum(),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: Text(
                      "Toss",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Card(
                    elevation: 10,
                    color: Colors.cyanAccent,
                    child: Container(
                        height: 50,
                        child: Center(
                            child: Text(
                          match["team1"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))),
                  ),
                ),
                Text("VS"),
                Expanded(
                  child: Card(
                    elevation: 10,
                    color: Colors.cyanAccent,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          match["team2"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(toss,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(PlayScreen.route);
            }, child: Text("Proceed"))
          ],
        ),
      ),
    );
  }
}
