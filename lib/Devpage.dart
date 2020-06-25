
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19_flutter_app/widgets/my_header.dart';


class Devpage extends StatefulWidget{
  @override 
  _DevpageState createState() => _DevpageState();

}


class _DevpageState extends State<Devpage>{
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        controller: controller,
        child: Column(
          children:<Widget>[
          new ClipPath(
          clipper: MyClipper(),
          child: Container(
          width: double.infinity,
          height: 400,
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
          )),),
          new Container(
            width: double.infinity,
            child: Column(
              children:<Widget>[

                 new RaisedButton(
                onPressed: () => _launch("https://github.com/ClownMonster"),
                child:new Text("GitHub", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle( color: Colors.white) ,),
                color: Color(0xFF11249F),
                ),
                new Text(""),
                new RaisedButton(
                onPressed: () => _launch("https://www.instagram.com/clown_monster10/"),
                child:new Text("Instagram", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white) ,),
                color:  Color(0xFF11249F),
                ),
                new Text(""),
                new RaisedButton(
                onPressed: () => _launch("https://www.linkedin.com/in/mohan-kumar-k-6bbba8184/"),
                child:new Text("LinkedIn", textAlign: TextAlign.center, textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white) ,),
                color:  Color(0xFF11249F),

                ),
                new Container(
                  margin: EdgeInsets.only(top:10),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
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
                  width: double.infinity,
                  child: Text("Copyright © 2020 ClownMonster's Inc", 
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