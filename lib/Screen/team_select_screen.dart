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

  bool flag1 = true;
  bool flag2 = true;

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
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "1".text.xl.bold.make(),
                  SizedBox(
                    width: 110,
                  ),
                  "2".text.xl.bold.make(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                  onPressed: () {
                      UpdateMutation("over", 0.6);

                      setState(() {
                        if(flag2){
                          flag1 = !flag1;
                        }
                      });
                    },
                    child: flag1 ?Icon(Icons.circle_outlined,color: Colors.brown,size: 30,):
                    Icon(Icons.circle,color: Colors.greenAccent,size: 30,)
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        UpdateMutation("over", 1.6);
                        setState(() {
                          if(flag1){
                            flag2 = !flag2;
                          }
                        });
                      },
                      child: flag2 ?Icon(Icons.circle_outlined,color: Colors.brown,size: 30,):
                      Icon(Icons.circle,color: Colors.greenAccent,size: 30,)
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

                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.greenAccent)),
                onPressed: () => onSaved(),
                child: "Proceed".text.xl2.color(Colors.black).bold.make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
