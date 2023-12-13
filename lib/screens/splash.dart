//this page chaidaina
import 'package:flutter/material.dart';
import 'package:my_project/screens/bottom_bar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
   // _navigatetohome();
  }
_navigatetohome()async{
  await Future.delayed(Duration(milliseconds: 1500),(){});
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomBar()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blueGrey,
            ),
            Container(
              child: Text("Splash Screen",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}