// ignore_for_file: file_names

import 'package:covid_app2/components/Home/certificat_detail/certificat_details.dart';
import 'package:covid_app2/constants.dart';
import 'package:covid_app2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_app2/components/Home/certificatPage/certificat_page.dart';
import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class QrList extends StatefulWidget {
  // ignore: non_constant_identifier_names
  List<QrCodeModel> QrDataList;
  Function setDataList;

  //SwitchScreen ss;
  // QrCodeModel qrCode;
  QrList(this.QrDataList, this.setDataList, {Key? key}) : super(key: key);

  @override
  _QrListState createState() => _QrListState();
}

class _QrListState extends State<QrList> {
  //late QrCodeModel qrCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: MediaQuery.of(context).size.height,
      child: (widget.QrDataList.isEmpty)
          ? const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ))
          : ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // navigate to certificatPage
          },
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 50,
                // offset: Offset(0, 0),
              )
            ], color: Colors.white),
            child: ListTile(
              title: Text(
                '✔️Details of ${qr_Data.qrCodeList[index].type as String}',
                style: TextStyle(
                    color: kTextMediumColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${qr_Data.qrCodeList[index].date}',
                  style: const TextStyle(
                      color: kgreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              leading: QrImage(
                data: qr_Data.qrCodeList[index].content as String,
                size: 50,
              ),
              // ignore: avoid_print
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CertificatPage(
                      qr_Data.qrCodeList[index],
                      widget.setDataList,
                    )));
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context)=>CertificatDetails("Certificat Page"))
                // );
              },
              // subtitle: const  Text(dt1.toString()),
            ),
          ),
        ),
        itemCount: widget.QrDataList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}