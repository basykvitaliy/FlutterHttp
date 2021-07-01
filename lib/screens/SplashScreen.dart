import 'package:flutter/material.dart';
import 'package:flutter_Nasa/screens/MainScreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Countries", style: TextStyle(fontSize: 30, color: Colors.blue),),
            Container(height: 300, width: 300,
            child: Lottie.asset("assets/65210-loading-colour-dots.json"),)
          ],
        ),
      ),
    );
  }
}
