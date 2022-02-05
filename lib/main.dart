import 'package:covid_app2/constants.dart';
import 'package:covid_app2/nearby/nearby_conections.dart';
import 'package:covid_app2/screens/home_screen.dart';
import 'package:covid_app2/switch_la.dart';
import 'package:covid_app2/translations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'package:covid_app2/authentification/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'components/helpers/ObjecBox.dart';
import 'get_start.dart';

//void main() {
Future main() async {


  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp();

  ObjectBox.createStore();

  String? fcmtokentest = await prefs.getString("fcmtoken");


  print('printing fcmtoken from shared preferences');
  print('*'+fcmtokentest.toString()+'*');

  if(fcmtokentest==null){

    print('this is the fcm token');
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);

    await prefs.setString('fcmtoken', token!.toString());
  }

  NearbyConections cnx = NearbyConections();
  cnx.init();


  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AuthProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Covid-19 App',
        debugShowCheckedModeBanner: false,
        translations: CovidTranslations(),
        home: Scaffold(
          body: Center(child: Consumer<AuthProvider>(
            builder: (context, auth, child) {
              print("printing if authenticated or not");
              print(auth.isAuthenticated());
              switch (auth.isAuthenticated()) {
                case true:
                  return const Start();
                default:
                  return const Start();
              }
            },
          )),
        ));
  }
}
