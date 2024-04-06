import 'package:flutter/cupertino.dart';

class Teams with ChangeNotifier{

  // final List teams = [];

  final Map<String, dynamic> info = {
   "over" : 0.0,
   "team1" : "",
   "team2" : "",
   "bat" : 0,
   "total" : 0,
  };
Map<String, dynamic> ballingTracker = {
   "1" : 0,
   "2" : 0,
   "3" : 0,
   "4" : 0,
   "6" : 0,
   "wide" : "",
   "noBall" : "",
   "bit" : "",
  };


  void update(String key, dynamic val) {
    info.update(key, (value) => value = val);
    notifyListeners();
  }
  void updateBalling(String key, dynamic val) {
    ballingTracker.update(key, (value) => value = val);
    notifyListeners();
  }

  void plusTotal(int num){
    int total = info['total'];
    info.update("total", (value) => value = total+num);
    notifyListeners();
  }

  void updateBallingToZero(){
    ballingTracker = {
      "1" : 0,
      "2" : 0,
      "3" : 0,
      "4" : 0,
      "6" : 0,
      "wide" : "",
      "noBall" : "",
      "bit" : "",
    };
    notifyListeners();
  }



}
