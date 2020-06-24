//import 'dart:convert';
//import 'dart:html';

import 'package:covid19_flutter_app/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19_flutter_app/constants.dart';
import 'package:covid19_flutter_app/Devpage.dart';
import 'package:covid19_flutter_app/widgets/counter.dart';
import 'package:covid19_flutter_app/apiData/India.dart';
//import 'package:http/http.dart' as http;


void main() => runApp(ClownCovidApp());

class ClownCovidApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clown Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final controller = ScrollController();
  double offset = 0;

  // List for DropDown Menu
  States selectedState;
  List<States> states = <States>[
    const States(-1,"India"),
    const States(4, "Karnataka"),
    const States(5, "TamilNadu"),
    ];

  // Api Request Holder
  Future<ApiData> indianData;

  @override
  void setState(fn) {
    // TODO: implement setState
    selectedState = states[0]; // DropDown Initial Value set
    
   super.setState(fn);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedState = states[0];
   // controller.addListener(onScroll);
    indianData = fetchData(-1); // Api Initial Request Made and state is set with that value
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //controller.dispose(); this changes the dropdown selected value on scroll
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
          body: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: <Widget>[
                MyHeader(
                  image: "assets/Icons/Drcorona.svg",
                  textTop: "Clown",
                  textBottom: "Monster's Inc",
                  offset: offset,
                  pageNo: "1",
                ),
                new Card(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[Text("Developers Info"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Devpage();
                          }));
                        },
                        child:  Image.asset("assets/Images/clowndev.jpg", width: 50,height: 50,)
                      ),
                    ]
                  ),
    
                ),
               new Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/Icons/maps-and-flags.svg"),
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton<States>(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: SvgPicture.asset("assets/Icons/dropdown.svg"),
                          value: selectedState,
                          onChanged: (States newvalue){
                            setState(() {
                              this.selectedState = newvalue;
                              indianData = fetchData(newvalue.ID);
                            });

                          },
                          items: states.map((States state){
                            return new DropdownMenuItem<States>(
                              value: state,
                              child: Text(state.Name),
                            );
                          }).toList(),

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: DateTime.now().toString(),
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child:FutureBuilder<ApiData>(
                      future: indianData,
                      builder: (context, snapshot){
                       if(!snapshot.hasData) {
                          
                          return Container(
                            child: Column(
                              children: <Widget>[
                                new Text("Check your Internet connection",
                                textAlign: TextAlign.center, 
                                style: TextStyle(color:Colors.black),
                                ),
                                new Text(""),
                                new CircularProgressIndicator(),
                              ],
                              ),
                          );
                          }
                       else return Column(
                        children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          title: "Infected",
                          number:snapshot.data.TotalConfirmedCases,
                          
                        ),
                        Text(""),
                        Counter(
                          color: kDeathColor,
                          number: snapshot.data.TotalDeathCases,
                          title: "Deaths",
                        ),
                        Text(""),
                        Counter(
                          color: kRecovercolor,
                          number: snapshot.data.TotalDeathCases,
                          title: "Recovered",
                        ),
                      ],

                       );
                      }
                    ),
                  ),
                 
                ],
              ),
              
            ),
            new Container(
                  margin: EdgeInsets.only(top:10),
                  padding: EdgeInsets.only(left:20,right:30, top: 4),
                  width: double.infinity,
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
                  
                  height: 60,
                  child: Text("Copy Rights @ ClownMonster's Inc 2020", 
                  textAlign: TextAlign.center, style: TextStyle(color:Colors.white),
                  ),
                ),
            
          ],
        ),
      ),
    );
  }
}



// for listing States in DropDown
class States{
  const States(this.ID, this.Name);
  final int ID;
  final String Name;
}