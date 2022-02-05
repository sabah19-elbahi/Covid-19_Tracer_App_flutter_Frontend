// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors

import 'package:covid_app2/authentification/login.dart';
import 'package:covid_app2/authentification/register.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'constants.dart';

// ignore: must_be_immutable
class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Positioned(
            top: 30,
            right: 10,
            child: Image.asset(
              "assets/images/29.png",
              height: 470,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          const TitleWithCustomUnderline2(text: 'Welcome to Covid-19 Tracer!'),
          SizedBox(
            height: 1,
          ),
          const TitleWithCustomUnderline2(text: 'Get Started!'),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                  'Keep others safe by alerting them if you test positive for COVID-19',
                  style: TextStyle(
                    color: kTextMediumColor.withOpacity(0.9),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 200,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterForm()))
              },
              color: kgreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 200,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginForm()))
              },
              color: kgreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}