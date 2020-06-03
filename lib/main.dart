import 'package:flutter/material.dart';
import 'package:covid19_flutter_app/constants.dart';


void main(){
  runApp(ClownCovidApp());
}





class ClownCovidApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Covid 19',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
      scaffoldBackgroundColor: kBackgroundColor,
      fontFamily: "Poppins",
      textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor) )
      ),

      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Container(
          height:350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF3383CD), Color(0xFF112497)]

            )

          ),
          
        )],
      ),



    );

 
  }
}
