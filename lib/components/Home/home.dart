// ignore_for_file: file_names

import 'package:covid_app2/components/Home/certificat_detail/certificat_details.dart';
import 'package:flutter/material.dart';
import 'package:covid_app2/components/Home/scan/import_pcr.dart';
import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'qrList/qr_list.dart';
import 'scan/import_pcr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  List<QrCodeModel> QrDataList = [];
  late QrCodeModel qrCode;
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
    //final SwitchScreen mySs = widget.ss;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ImportPcr(setDataList)));
        },
        child: const Icon(Icons.qr_code),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          QrList(QrDataList, setDataList),
        ],
      )),
    );
  }
}
