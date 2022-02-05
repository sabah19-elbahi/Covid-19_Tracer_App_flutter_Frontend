// ignore_for_file: unnecessary_new

import 'package:covid_app2/authentification/register.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_app2/authentification/auth.dart';
import 'package:covid_app2/constants.dart';
import '../switch_la.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  String _errorMessage = '';

  Future<String> submitForm() async {
    setState(() {
      _errorMessage = '';
    });
    bool result = await Provider.of<AuthProvider>(context, listen: false)
        .login(_email, _password);
    if (result == false) {
      setState(() {
        _errorMessage = 'There was a problem with your credentials.';
      });
    }
    print("printing error message");
    print(_errorMessage);
    return _errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    String _error='';
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
                "assets/images/25.png",
                height: 400,
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
                    hintText: 'Email',
                    icon: const Icon(
                      Icons.mail,
                      color: kgreen2,
                    ),
                    hintStyle: const TextStyle(color: kgreen2),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: kgreen2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: kgreen2)),
                    //filled: true,
                    //fillColor: Color(0xff161d27).withOpacity(0.9),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter an email address' : null,
                  onSaved: (value) => _email = value!,
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
                    icon: const Icon(
                      Icons.lock,
                      color: kgreen2,
                    ),
                    hintStyle: const TextStyle(color: kgreen2),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: kgreen2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: kgreen2)),
                    //filled: true,
                    //fillColor: Color(0xff161d27).withOpacity(0.9),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter a password' : null,
                  onSaved: (value) => _password = value!,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kgreen2,
                  onPrimary: Colors.white,
                  fixedSize: const Size(190, 50),
                  shape: const StadiumBorder(),
                ),
                onPressed: () async => {

                  if (_formKey.currentState!.validate())
                    {
                      _formKey.currentState!.save(),
                    _error= await submitForm(),


                    },
                  print("printing error message from other side"),

                  print(_error),
                  if(_error == ''){
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
                        builder: (context) => const RegisterForm()))
              },
              child: const Text(
                  'You dont have an account yet?Register from here!'),
            ),
          ],
        ),
      ),
    );
  }
}
