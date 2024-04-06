import 'package:add_drop_product/Screen/toss_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/team.dart';

class TeamSelection extends StatefulWidget {
  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  final _team1Controller = TextEditingController();
  final _team2Controller = TextEditingController();

  final _key = GlobalKey<FormState>();

  Color _cardColor1 = Colors.white;
  Color _cardColor2 = Colors.white;


  void onSaved(){

    Provider.of<Teams>(context,listen: false).update("team1",_team1Controller.text);
    Provider.of<Teams>(context,listen: false).update("team2",_team2Controller.text);

    Navigator.of(context).pushNamed(TossScreen.route);

  }


  @override
  Widget build(BuildContext context) {
    final match = Provider.of<Teams>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Select Your Team")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text("Select Overs"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      match.update("over",1);
                      _cardColor1 =
                          _cardColor1 == Colors.blue ? Colors.white : Colors.blue;
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
                          child: Center(child: Text("1")),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      match.update("over",2);
                      _cardColor2 =
                          _cardColor2 == Colors.blue ? Colors.white : Colors.blue;
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
                          child: Center(child: Text("2")),
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
                  label: Text("Team A"),
                  hintText: "Enter team name",
                ),


              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _team2Controller,
                decoration: InputDecoration(
                  label: Text("Team B"),
                  hintText: "Enter team name",
                ),

              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => onSaved(),
                child: Text("Proceed"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
