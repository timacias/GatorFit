import 'package:flutter/material.dart';
import 'package:gatorfit_flutter/IphoneExercisePage.dart';
import 'IphoneDietPage.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Iphone16HomePage(),
        ]),
      ),
    );
  }
}

class Iphone16HomePage extends StatelessWidget {
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IphoneDietPage())
                    );
                  },
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
              //Exercise Button
              Positioned(
                left: 97,
                top: 768,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IphoneExercisePage() ),
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
                left: 6,
                top: 140,
                child: Container(
                  width: 187,
                  height: 187,
                  decoration: ShapeDecoration(
                    color: Color(0xE1ACD2BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
                left: 200,
                top: 140,
                child: Container(
                  width: 187,
                  height: 187,
                  decoration: ShapeDecoration(
                    color: Color(0xE1ACD2BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 165,
                child: Text(
                  'Workout Plan:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 158,
                child: Container(
                  width: 151,
                  height: 151,
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
                  width: 151,
                  height: 151,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 18, color: Color(0xFFA2D0FF)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 53,
                top: 222,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '1400',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 219,
                top: 234,
                child: SizedBox(
                  width: 149,
                  height: 41,
                  child: SizedBox(
                    width: 149,
                    height: 41,
                    child: Text(
                      'Muscle Growth',
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
                left: 9,
                top: 352,
                child: Container(
                  width: 378,
                  height: 187,
                  decoration: ShapeDecoration(
                    color: Color(0xE1A8D5BA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 375,
                child: Text(
                  'Leaderboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 66,
                top: 203,
                child: Text(
                  'Calories:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
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