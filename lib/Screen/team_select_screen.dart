import 'package:add_drop_product/Screen/toss_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../provider/team.dart';

class TeamSelection extends StatefulWidget {
  static final route = "./selectTeam";
  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  final _team1Controller = TextEditingController();
  final _team2Controller = TextEditingController();

  final _key = GlobalKey<FormState>();

  Color _cardColor1 = Colors.white;
  Color _cardColor2 = Colors.white;

  void onSaved() {
    UpdateMutation("team1", _team1Controller.text);
    UpdateMutation("team2", _team2Controller.text);

    Navigator.of(context).popAndPushNamed(TossScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final TeamsModel teams = (VxState.store as MyStore).teams;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text("Select Your Team"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              "Select Overs".text.xl3.bold.make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      UpdateMutation("over", 0.6);
                      _cardColor1 = _cardColor1 == Colors.blue
                          ? Colors.white
                          : Colors.yellow;
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        color: _cardColor1,
                        elevation: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      UpdateMutation("over", 1.6);
                      _cardColor2 = _cardColor2 == Colors.blue
                          ? Colors.white
                          : Colors.yellow;
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        color: _cardColor2,
                        elevation: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(child: Text("2",style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _team1Controller,
                decoration: InputDecoration(
                  label: "Team A".text.xl.bold.color(Colors.black87).make(),
                  hintText: "Enter team name",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _team2Controller,
                decoration: InputDecoration(
                  label: "Team A".text.xl.bold.color(Colors.black87).make(),
                  hintText: "Enter team name",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(

                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
                onPressed: () => onSaved(),
                child: "Proceed".text.xl2.color(Colors.black87).bold.make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
