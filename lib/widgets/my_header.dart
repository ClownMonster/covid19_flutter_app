import 'package:covid19_flutter_app/InfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid19_flutter_app/constants.dart';
import 'package:covid19_flutter_app/main.dart';


class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  final String pageNo;

  const MyHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset, this.pageNo})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState(this.pageNo);
}

class _MyHeaderState extends State<MyHeader> {
  var pageNo;
  _MyHeaderState(pageNo){
    this.pageNo = pageNo;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/Images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                       if(pageNo == "1"){
                        return InfoScreen();
                      }
                      else{
                        return ClownCovidApp();
                      }
                    },
                  ),
                );
              },
              child: new Column(children: <Widget>[
               new SvgPicture.asset("assets/Icons/menu.svg"),
               new Text("Menu", textAlign: TextAlign.center,
               style: TextStyle(color:Colors.white),),

              ],),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 - widget.offset / 2,
                    left: 150,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: KHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
