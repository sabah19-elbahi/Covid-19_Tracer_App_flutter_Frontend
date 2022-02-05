// ignore_for_file: sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_cast

import 'package:covid_app2/components/Home/certificat_detail/pcr_datail.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:flutter/material.dart';
import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CertificatPage extends StatefulWidget {
  QrCodeModel qrCode;
  Function setDataList;

  // SwitchScreen ss;
  CertificatPage(this.qrCode, this.setDataList);

  @override
  _CertificatPageState createState() => _CertificatPageState();
}

class _CertificatPageState extends State<CertificatPage> {
  @override
  Widget build(BuildContext context) {
    QrCodeModel myQr = widget.qrCode;
    DateTime dt1 = DateTime.parse('${myQr.date}');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            TitleWithCustomUnderline2(text: '${myQr.type} Details'.tr),
            const SizedBox(height: 10),
            SizedBox(
              height: 25,
            ),
            QrImage(
              data: myQr.content as String,
              size: 250,
            ),
            SizedBox(
              height: 20,
            ),
            //   Text(myQr.content as String),
            Text(myQr.type as String,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            Column(
              children: [
                Text(dt1.toString(),
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),

            Column(
              children: [
                if (myQr.type == 'PCR Test') ...[
                  Text(
                      (myQr.pcr as bool)
                          ? 'Covid-19 test is Positive 🥺'
                          : 'Covid-19 test is Negative 😊',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ] else ...[
                  Text(''),
                ],
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          await qr_Data.box.remove(myQr.id);
          qr_Data.initData(widget.setDataList);

          Navigator.pop(context);
        },
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}