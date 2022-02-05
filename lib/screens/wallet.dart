import 'package:covid_app2/components/Home/qrList/qr_list.dart';
import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'header_with_seachbox.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List<QrCodeModel> QrDataList = [];

  //QrCodeModel qrCode = qrCode;
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithCustomUnderline2(text: 'subtitle15_wallet'.tr),
          const SizedBox(height: 7),
          // ignore: prefer_const_literals_to_create_immutables

          QrList(QrDataList, setDataList),
        ],
      )),
    );
  }
}
