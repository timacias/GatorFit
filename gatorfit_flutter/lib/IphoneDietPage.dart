import 'package:flutter/material.dart';
import 'package:gatorfit_flutter/IphoneExercisePage.dart';
import 'package:gatorfit_flutter/main.dart';

class IphoneDietPage extends StatefulWidget{
  @override
  _IphoneDietPageState createState() => _IphoneDietPageState();
}

class _IphoneDietPageState extends State<IphoneDietPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
    ),
    child: Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFFFF9E5)),
          child: Stack(
            children: [
              Positioned(
                left: 91,
                top: 56,
                child: SizedBox(
                  width: 211,
                  height: 54,
                  child: SizedBox(
                    width: 211,
                    height: 54,
                    child: Text(
                      'GatorFit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.60,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 768,
                child: Container(
                  width: 61,
                  height: 99,
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 15,
                    bottom: 57,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/diet.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 818,
                child: SizedBox(
                  width: 31,
                  height: 19,
                  child: SizedBox(
                    width: 31,
                    height: 19,
                    child: Text(
                      'Diet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 768,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IphoneExercisePage()),
                    );
                  },
                child: Container(
                  height: 99,
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 11,
                    right: 10,
                    bottom: 51,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/exercise.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
              Positioned(
                left: 96,
                top: 818,
                child: SizedBox(
                  width: 64,
                  height: 19,
                  child: SizedBox(
                    width: 64,
                    height: 19,
                    child: Text(
                      'Exercise',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 203,
                top: 768,
                child: Container(
                  width: 61,
                  height: 99,
                  padding: const EdgeInsets.only(
                    top: 14,
                    left: 16,
                    right: 15,
                    bottom: 55,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/leaderboard.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 185,
                top: 818,
                child: SizedBox(
                  width: 97,
                  height: 19,
                  child: SizedBox(
                    width: 97,
                    height: 19,
                    child: Text(
                      'Leaderboard',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 323,
                top: 818,
                child: SizedBox(
                  width: 45,
                  height: 19,
                  child: SizedBox(
                    width: 45,
                    height: 19,
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                top: 98,
                child: Container(
                  width: 375.03,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 330,
                top: 781,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Iphone16HomePage()),
                    );
                  },
                child: Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/home.png"),
                    ),
                  ),
                ),
              ),
              ),
              Positioned(
                left: 77,
                top: 781,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                  child: Container(
                    width: 54,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: 140,
                child: Container(
                  width: 381,
                  height: 237,
                  decoration: ShapeDecoration(
                    color: Color(0xE1ACD2BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170,
                top: 781,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                  child: Container(
                    width: 54,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 299,
                top: 781,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                  child: Container(
                    width: 54,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 158,
                child: Container(
                  width: 187,
                  height: 187,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 18, color: Color(0xFFE6E6E6)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 158,
                child: Container(
                  width: 187,
                  height: 187,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 18, color: Color(0xFFA2D0FF)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 237,
                child: SizedBox(
                  width: 136,
                  height: 36,
                  child: SizedBox(
                    width: 136,
                    height: 36,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1400',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '/2000',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 76,
                top: 214,
                child: SizedBox(
                  width: 84,
                  height: 23,
                  child: SizedBox(
                    width: 84,
                    height: 23,
                    child: Text(
                      'Calories:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 325,
                top: 68,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}