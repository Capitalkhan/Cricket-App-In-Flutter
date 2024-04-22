import 'package:add_drop_product/Screen/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math';

import '../core/store.dart';
import '../provider/team.dart';

class TossScreen extends StatelessWidget {
  static final route = './toss_route';

  final TeamsModel teams = (VxState.store as MyStore).teams;

  int? num;
  String toss = "";

  void randomNum() {
    num = Random().nextInt(100);
    UpdateMutation("bat", num);
    if (num! % 2 == 0) {
      toss = "${teams.info["team1"].toString()} Win The Toss";
    } else {
      toss = "${teams.info["team2"].toString()} Win The Toss";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
              splashColor: Colors.red,
              onTap: () => randomNum(),
              child: Center(
                child: Card(

                  color: Colors.red,
                  elevation: 29,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Center(
                      child: "Toss".text.xl2.color(Colors.black87).bold.make(),
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
                    elevation: 20,
                    color: Colors.cyanAccent,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          teams.info["team1"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                "VS".text.xl.bold.make(),
                Expanded(
                  child: Card(
                    elevation: 20,
                    color: Colors.cyanAccent,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          teams.info["team2"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            VxConsumer(
              notifications: {},
              mutations: {UpdateMutation},
              builder: (context, dynamic, _) => Text(
                toss,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
              onPressed: () {
                Navigator.of(context).popAndPushNamed(PlayScreen.route);
              },
              child: "Proceed".text.xl.color(Colors.black87).bold.make(),
            )
          ],
        ),
      ),
    );
  }
}
