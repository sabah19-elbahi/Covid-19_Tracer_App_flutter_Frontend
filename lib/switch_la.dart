// ignore_for_file: prefer_const_constructors

import 'package:covid_app2/authentification/login.dart';
import 'package:covid_app2/authentification/register.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:covid_app2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/scheduler.dart';
import 'constants.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:covid_app2/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SwitchLa extends StatefulWidget {
  const SwitchLa({Key? key}) : super(key: key);

  @override
  _SwitchLaState createState() => _SwitchLaState();
}

class _SwitchLaState extends State<SwitchLa> {
  @override
  void initState() {
    super.initState();
  }

  List images = [
    'assets/images/usa_flag2.png',
    'assets/images/ma_flag2.png',
  ];

  final locales = [
    {
      'name': 'English',
      'locale': Locale('en', 'US'),
    },
    {
      'name': 'العربية',
      'locale': Locale('ar', 'MA'),
    },
  ];
  showLocalDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
          title: TitleWithCustomUnderline2(text: 'Choose your language'.tr),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  child: ListTile(
                    title: Text(
                      locales[index]['name'] as String,
                      style: TextStyle(
                          color: kTextMediumColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () => updateLocale(
                      locales[index]['locale'] as Locale, context),
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                ),
                itemCount: 2),
          ),
        ));
  }

  updateLocale(Locale locale, BuildContext context) {
    Navigator.of(context).pop();
    Get.updateLocale(locale);
    //translations: CovidTranslations(),
    // locale: Get.deviceLocale,
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Positioned(
              top: 30,
              right: 10,
              child: Image.asset(
                "assets/images/30.png",
                height: 470,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            TitleWithCustomUnderline2(text: 'Configure your language before'),
            SizedBox(
              height: 1,
            ),
            TitleWithCustomUnderline2(text: 'before accessing your space!'),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: FlatButton(
                onPressed: () => showLocalDialog(context),
                color: kgreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Choose your language'.tr,
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
              width: 250,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: FlatButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()))
                },
                color: kgreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Access your space'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}