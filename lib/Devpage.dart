
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Devpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children:<Widget>[Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
              Color(0xFF11249F),
            ],
          ),
          ),
  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             new Container(
               width:150.0,
               height:150.0,
               decoration: BoxDecoration(
                 shape:BoxShape.circle,
                 image: new DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage("assets/Images/clown1.jpg"),
                   )),

             ),
             new Text("Mohan Kumar K", textScaleFactor:1.5, style: TextStyle(color:Colors.white),),
             new Container(
               child:Column(
                 children: <Widget>[
                  new BackButton(
                    color:Colors.white,
                     ),
                   new Text("Go Back", textScaleFactor: 0.8,style: TextStyle(color:Colors.white),)
  
                 ],
               )
             ),
            
            ]
          )),
          new Container(
            width: double.infinity,
            height: 300.0,
            margin:EdgeInsets.only(top:30),
            child: Column(
              children:<Widget>[

                 new RaisedButton(onPressed: () => _launch("https://github.com/ClownMonster"),
                child:new Text("GitHub", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle( color: Colors.white) ,),
                color: Colors.purple,
                ),
                new Text(""),
                new RaisedButton(onPressed: () => _launch("https://github.com/ClownMonster"),
                child:new Text("Instagram", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white) ,),
                color: Colors.purple,
                ),
                new Text(""),
                new RaisedButton(onPressed: () => _launch("https://github.com/ClownMonster"),
                child:new Text("Twitter", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white) ,),
                color: Colors.purple,

                ),
                
                new Container(
                  margin: EdgeInsets.only(top:10),
                  alignment: Alignment.center,
                  color: Colors.black,
                  width: double.infinity,
                  height: 45,
                  child: Text("Copy Rights @ ClownMonster's Inc 2020", 
                  textAlign: TextAlign.center, style: TextStyle(color:Colors.white),
                  ),
                ),
                
              
              ]
            ),
          ),
          ])

      ),
    );
  }



}

// this function checks whether a url can be launched from onpress raised button
// asychronous launch to web on press
_launch(url) async{
  if (await canLaunch(url)){
    await launch(url);
  }
  else{
    throw "Could not Launch";
  }


}