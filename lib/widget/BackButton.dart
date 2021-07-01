import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BackButton extends StatefulWidget {
  const BackButton({Key key}) : super(key: key);

  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {

  DateTime backCtnPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop()async{
    DateTime currentTime = DateTime.now();
    bool backButton = await backCtnPressTime == null || currentTime.difference(backCtnPressTime) > Duration(seconds: 3);
    if(backButton){
      backCtnPressTime = currentTime;
      Fluttertoast.showToast(msg: "Dooble click");
      return false;
    }
    return true;
  }
}
