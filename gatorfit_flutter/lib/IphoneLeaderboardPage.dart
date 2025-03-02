import "package:flutter/material.dart";
import "package:gatorfit_flutter/IphoneExercisePage.dart";
import "package:gatorfit_flutter/main.dart";
import "package:gatorfit_flutter/IphoneDietPage.dart";

class IphoneLeaderboardPage extends StatefulWidget{
  @override
  _IphoneLeaderboardPageState createState() => _IphoneLeaderboardPageState();
}

class _IphoneLeaderboardPageState extends State<IphoneLeaderboardPage> {
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
                      MaterialPageRoute(builder: (context) => IphoneDietPage()),
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
                left: 6,
                top: 140,
                child: Container(
                  width: 381,
                  height: 564,
                  decoration: ShapeDecoration(
                    color: Color(0xE1ACD2BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
                left: 19,
                top: 302,
                child: SizedBox(
                  width: 356,
                  child: SizedBox(
                    width: 356,
                    child: Text(
                      'Firstplace Namington.............2357\nSecondplace Lastname..........2340\nThirdplace Name....................2300\nFourthplace Name..................2000',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
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
              Positioned(
                left: 111,
                top: 149,
                child: Text(
                  'Leaderboard',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 129,
                top: 176,
                child: Container(
                  width: 135,
                  height: 126,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/colorTrophy.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 670,
                child: SizedBox(
                  width: 356,
                  height: 34,
                  child: SizedBox(
                    width: 356,
                    height: 34,
                    child: Text(
                      '95.Your Name.................................350',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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