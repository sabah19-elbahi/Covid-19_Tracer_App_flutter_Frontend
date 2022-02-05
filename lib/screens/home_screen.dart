// ignore_for_file: prefer_equal_for_default_values, deprecated_member_use

import 'package:covid_app2/components/Home/home.dart';
import 'package:covid_app2/components/Home/scan/import_cert.dart';
import 'package:covid_app2/components/Home/scan/import_pass.dart';
import 'package:covid_app2/components/Home/scan/import_pcr.dart';

import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/constants.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:covid_app2/objectbox.g.dart';
import 'package:covid_app2/screens/details_screen.dart';
import 'package:covid_app2/screens/qrcode.dart';
import 'package:covid_app2/screens/wallet.dart';
import 'package:covid_app2/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../statistics.dart';
import 'header_with_seachbox.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StatisticsController statisticsController =
      Get.put(StatisticsController());

  List<QrCodeModel> QrDataList = [];
  @override
  void initState() {
    super.initState();

    qr_Data.initData(setDataList);
  }

  void setDataList(List<QrCodeModel> qrcodes) {
    setState(() {
      QrDataList = qrcodes;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//wrap singlechildscrollview for correct displaying in small density devices
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            // ignore: deprecated_member_use
            TitleWithCustomUnderline2(text: 'Title_welcome'.tr),
            const SizedBox(height: 7),
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'subtitle1_welcome'.tr,
                      style: TextStyle(
                        color: kTextMediumColor.withOpacity(0.9),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 9),
            TitleWithCustomUnderline1(text: 'subtitle2_welcome'.tr),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    title: 'conf_cases'.tr,
                    iconColor: const Color(0xFFFF8C00),
                    effectedNum: "${statisticsController.getNewCases}",
                    press: () {},
                  ),
                  InfoCard(
                    title: 'Recovered'.tr,
                    iconColor: const Color(0xFFFF2D55),
                    effectedNum: "${statisticsController.getRecovered}",
                    press: () {},
                  ),
                  InfoCard(
                    title: 'Vaccinated'.tr,
                    iconColor: const Color(0xFF50E3C2),
                    effectedNum: "${statisticsController.getVaccinated}",
                    press: () {},
                  ),
                  InfoCard(
                    title: 'Vaccinated_perc'.tr,
                    iconColor: const Color(0xFF5856D6),
                    effectedNum: "${statisticsController.getVaccinatedPerc}",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DetailsScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TitleWithCustomUnderline1(text: 'subtitle3_welcome'.tr),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text(
                    // "Preventions",
                    //  style: Theme.of(context)
                    //    .textTheme
                    //    .headline6!
                    //    .copyWith(fontWeight: FontWeight.bold),
                    // ),
                    const SizedBox(height: 40),
                    buildPreventation(),
                    const SizedBox(height: 40),
                    builTitle(context),
                    const SizedBox(height: 2),
                    builTitle2(context),
                    const SizedBox(height: 10),
                    buildHelpCard(context),
                    const SizedBox(height: 10),
                    buildHelpCard2(context),
                    const SizedBox(height: 10),
                    buildHelpCard3(context),
                    const SizedBox(height: 40),
                    builTitle3(context),
                    const SizedBox(height: 2),
                    buildHelpCard4(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PreventitonCard(
          svgSrc: "assets/icons/head2.svg",
          title: 'sym1'.tr,
        ),
        PreventitonCard(
          svgSrc: "assets/icons/fev.svg",
          title: 'sym2'.tr,
        ),
        PreventitonCard(
          svgSrc: "assets/icons/c2.svg",
          title: 'sym3'.tr,
        ),
      ],
    );
  }

  Container builTitle(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      alignment: Alignment.center,
      child: TitleWithCustomUnderline1(text: 'subtitle4_1_welcome'.tr),
    );
  }

  Container builTitle2(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'subtitle4_welcome'.tr,
              style: TextStyle(
                color: kTextMediumColor.withOpacity(0.9),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHelpCard(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 10,
              right: 20,
            ),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE68342),
                  Color(0xFFE68342),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'subtitle5_welcome'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'subtitle6_welcome'.tr,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                textColor: Colors.white.withOpacity(0.9), // foreground
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportPcr(setDataList)))
                },
                child: Icon(Icons.qr_code),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left side padding is 40% of total width

              top: 0.1,
            ),
            child: Image.asset(
              "assets/images/16.png",
              height: 900,
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  Container buildHelpCard2(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 10,
              right: 20,
            ),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFC7B8F5),
                  Color(0xFFC7B8F5),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'subtitle7_welcome'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'subtitle8_welcome'.tr,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                textColor: Colors.white.withOpacity(0.9), // foreground
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportCer(setDataList)))
                },
                child: const Icon(Icons.qr_code),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left side padding is 40% of total width

              top: 0.1,
            ),
            child: Image.asset(
              "assets/images/cer.png",
              height: 900,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  Container buildHelpCard3(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 10,
              right: 20,
            ),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xfff8bbd0),
                  Color(0xfff8bbd0),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'subtitle9_welcome'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'subtitle10_welcome'.tr,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                textColor: Colors.white.withOpacity(0.9), // foreground
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportPass(setDataList)))
                },
                child: const Icon(Icons.qr_code),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left side padding is 40% of total width

              top: 0.1,
            ),
            child: Image.asset(
              "assets/images/vacc.png",
              height: 900,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  Container builTitle3(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      alignment: Alignment.center,
      child: TitleWithCustomUnderline1(text: 'subtitle11_welcome'.tr),
    );
  }

  Container builTitle4(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "If you want to visualize your test,pass,vaccination certificates.",
              style: TextStyle(
                color: kTextMediumColor.withOpacity(0.9),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHelpCard4(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .4,
              top: 10,
              right: 20,
            ),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF92E3A9),
                  Color(0xFF92E3A9),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'subtitle12_welcome'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'subtitle13_welcome'.tr,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                textColor: Colors.white.withOpacity(0.9), // foreground
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wallet()))
                },
                child: Text('text_button1'.tr),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              // left side padding is 40% of total width
              right: 170,
              top: 0.1,
            ),
            child: SvgPicture.asset(
              "assets/icons/w1.svg",
              height: 190,
              width: 200,
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
