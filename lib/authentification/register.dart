// ignore_for_file: unnecessary_new

import 'package:covid_app2/authentification/login.dart';
import 'package:covid_app2/constants.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_app2/authentification/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../switch_la.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  String? _password_confirmation;
  String _errorMessage = '';

  Future<void> submitForm() async {
    setState(() {
      _errorMessage = '';
    });


    String _udid = await Provider.of<AuthProvider>(context, listen: false).getDeviceId();

    final prefs = await SharedPreferences.getInstance();
    String? _fcmtokentest = await prefs.getString("fcmtoken");

    print("printing fcm tok from register submit form ");
    print(_fcmtokentest!.toString());


    bool result = await Provider.of<AuthProvider>(context, listen: false)
        .register(_name!, _email!, _password!, _password_confirmation!, _udid, _fcmtokentest.toString());
    if (result == false) {
      setState(() {
        _errorMessage = 'There was a problem with your credentials.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Positioned(
                top: 30,
                right: 10,
                child: Image.asset(
                  "assets/images/21.png",
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const TitleWithCustomUnderline2(text: 'Covid-19 Tracer!'),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: new Container(
                  height: 50,
                  width: 350,
                  //margin: EdgeInsets.only(left: 200, right: 200),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Full Name',
                      icon: Icon(
                        Icons.person,
                        color: kgreen,
                      ),
                      hintStyle: TextStyle(color: kgreen),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      //filled: true,
                      //fillColor: Color(0xff161d27).withOpacity(0.9),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    onSaved: (value) => _name = value,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: new Container(
                  height: 50,
                  width: 350,
                  //margin: EdgeInsets.only(left: 200, right: 200),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: kgreen,
                      ),
                      hintStyle: TextStyle(color: kgreen),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      //filled: true,
                      //fillColor: Color(0xff161d27).withOpacity(0.9),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an email address' : null,
                    onSaved: (value) => _email = value,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: new Container(
                  height: 50,
                  width: 350,
                  //margin: EdgeInsets.only(left: 200, right: 200),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: Icon(
                        Icons.lock,
                        color: kgreen,
                      ),
                      hintStyle: TextStyle(color: kgreen),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      //filled: true,
                      //fillColor: Color(0xff161d27).withOpacity(0.9),
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a password' : null,
                    onSaved: (value) => _password = value,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: new Container(
                  height: 50,
                  width: 350,
                  //margin: EdgeInsets.only(left: 200, right: 200),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Password Confirmation',
                      icon: Icon(
                        Icons.lock,
                        color: kgreen,
                      ),
                      hintStyle: TextStyle(color: kgreen),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: kgreen)),
                      //filled: true,
                      //fillColor: Color(0xff161d27).withOpacity(0.9),
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Please confirm your password' : null,
                    onSaved: (value) => _password_confirmation = value,
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kgreen,
                    onPrimary: Colors.white,
                    fixedSize: const Size(190, 50),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        submitForm(),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SwitchLa()))
                      }
                  },
                ),
              ),
              FlatButton(
                textColor: kActiveIconColor.withOpacity(0.9), // foreground
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginForm()))
                },
                child: const Text(
                    'Are you already have an account?Login from here!'),
              ),
            ],
          ),
        ));
  }
}
