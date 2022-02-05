// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:covid_app2/components/Home/certificat_detail/pcr_datail.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:covid_app2/components/Home/certificat_detail/certificat_details.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

// ignore: must_be_immutable
class ImportPcr extends StatefulWidget {
  Function setDataList;

  ImportPcr(this.setDataList);

  @override
  _ImportPcrState createState() => _ImportPcrState();
}

class _ImportPcrState extends State<ImportPcr> {
  // String? imported_code;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          const SizedBox(height: 80),
          GestureDetector(
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'button2_importscan'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
              );

              print("printing result to string");
              print(result?.paths.single);



              if (result != null) {
                String imported_code = await QrCodeToolsPlugin.decodeFrom(
                        result?.paths.single)
                    .onError((error, stackTrace) {
                  const ScaffoldMessenger(
                      child: SnackBar(
                    content: Text("No Code Found"),
                  ));
                  return '';
                });

                if (imported_code == '') {
                  return;
                }

                QrCodeModel qr_res = QrCodeModel(
                    content: imported_code,
                    date: DateTime.now(),
                    type: 'qrCode',
                    id: 0);

                print("\n\n\n================ result is : ${qr_res.content} \n\n\n");

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        PcrDetails(qr_res, widget.setDataList)));
              }
            },
          ),
        ],
      )),
    );
  }
}
