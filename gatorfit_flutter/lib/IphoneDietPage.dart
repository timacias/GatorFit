import 'package:flutter/material.dart';
import 'package:gatorfit_flutter/IphoneExercisePage.dart';
import 'package:gatorfit_flutter/IphoneLeaderboardPage.dart';
import 'package:gatorfit_flutter/main.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('http://localhost:5000/1/attribute/daily_caloric_goal'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int user_bmr;

  const Album({required this.user_bmr});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'user_bmr': int user_bmr} => Album(
        user_bmr: user_bmr,
      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class IphoneDietPage extends StatefulWidget{
  @override
  _IphoneDietPageState createState() => _IphoneDietPageState();
}

class _IphoneDietPageState extends State<IphoneDietPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IphoneLeaderboardPage()),
                    );
                  },
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
                  height: 221,
                  decoration: ShapeDecoration(
                    color: Color(0xE1ACD2BB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: 368,
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
                left: 6,
                top: 613,
                child: Container(
                  width: 381,
                  height: 76,
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
                            text: '1440',
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
              Positioned(
                left: 27,
                top: 488,
                child: SizedBox(
                  width: 144,
                  height: 24,
                  child: SizedBox(
                    width: 144,
                    height: 24,
                    child: Text(
                      'Carbs: 20g/40g',
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
                left: 27,
                top: 451,
                child: SizedBox(
                  width: 151,
                  height: 30,
                  child: SizedBox(
                    width: 151,
                    height: 30,
                    child: Text(
                      'Fats: 11g/30g',
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
                top: 386,
                child: SizedBox(
                  width: 184,
                  height: 47,
                  child: SizedBox(
                    width: 184,
                    height: 47,
                    child: Text(
                      'Macronutrients\nTracker',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 158,
                child: SizedBox(
                  width: 157,
                  height: 23,
                  child: SizedBox(
                    width: 157,
                    height: 23,
                    child: Text(
                      'Calorie Tracker',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ),
              Positioned(
                left: 227,
                top: 293,
                child: SizedBox(
                  width: 157,
                  height: 56,
                  child: SizedBox(
                    width: 157,
                    height: 56,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Recent Entry',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: ':\nChicken Breast',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ),
              Positioned(
                left: 27,
                top: 525,
                child: SizedBox(
                  width: 152,
                  height: 24,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'Protein: 35g/120g',
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
                left: 17,
                top: 457,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: ShapeDecoration(
                      color: Color(0xFFC1AE31),
                      shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 494,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: Color(0xFFC13131),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 531,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3140C1),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 629,
                 child: SizedBox(
                    width: 282,
                    height: 25,
                    child: SizedBox(
                      width: 282,
                      height: 25,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Current Plan: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Muscle Growth',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              Positioned(
                left: 298,
                top: 634,
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF0008FF),
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  )
              ),
              Positioned(
                left: 182,
                top: 394,
                child: SizedBox(
                  width: 187,
                  height: 187,
                    child: CircularProgressIndicator(
                      value: 0.3,
                      strokeWidth: 18,
                      backgroundColor:  Color(0xFF3140C1).withOpacity(0.5),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0008FF)),
                    ),
                ),
              ),
              Positioned(
                left: 203,
                top: 415,
                child: SizedBox(
                  width: 145,
                  height: 145,
                  child: CircularProgressIndicator(
                    value: 0.45,
                    strokeWidth: 18,
                    backgroundColor:  Color(0xFFC1AE31).withOpacity(0.4),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC1AE31)),
                  ),
                ),
              ),
              Positioned(
                left: 226,
                top: 438,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    strokeWidth: 18,
                    backgroundColor:  Color(0xFFC13131).withOpacity(0.4),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC13131)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
    );
  }
}