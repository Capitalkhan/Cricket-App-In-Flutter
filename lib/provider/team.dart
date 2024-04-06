import 'package:add_drop_product/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class TeamsModel{

  // final List teams = [];

  final Map<String, dynamic> info = {
   "over" : 0.0,
   "team1" : "",
   "team2" : "",
   "bat" : 0,
   "total" : 0,
  };
// Map<String, dynamic> ballingTracker = {
//    "1" : 0,
//    "2" : 0,
//    "3" : 0,
//    "4" : 0,
//    "6" : 0,
//    "wide" : "",
//    "noBall" : "",
//    "bit" : "",
 // };


  // void update(String key, dynamic val) {
  //   info.update(key, (value) => value = val);
  //   // notifyListeners();
  // }
  // void updateBalling(String key, dynamic val) {
  //   ballingTracker.update(key, (value) => value = val);
  //   // notifyListeners();
  // }

  // void plusTotal(int num){
  //   int total = info['total'];
  //   info.update("total", (value) => value = total+num);
  //   // notifyListeners();
  // }


}

class UpdateMutation extends VxMutation<MyStore> {

  final String key;
  final dynamic val;

  UpdateMutation(this.key,this.val);

  @override
  perform() {
    store?.teams.info.update(key, (value) => value = val);
  }

}
class UpdateBall extends VxMutation<MyStore> {

  final String key;
  final dynamic val;

  UpdateBall(this.key,this.val);

  @override
  perform() {
    store?.teams.ballingTracker.update(key, (value) => value = val);
  }

}
class AddTotalMutation extends VxMutation<MyStore> {

  final int num;

  AddTotalMutation(this.num);

  @override
  perform() {
    int total = store?.teams.info['total'];
    store?.teams.info.update("total", (value) => value = total+num);
  }
}









