// ignore_for_file: file_names, must_be_immutable, prefer_if_null_operators, use_key_in_widget_constructors, non_constant_identifier_names, unnecessary_new, avoid_init_to_null, prefer_const_constructors
import 'package:covid_app2/authentification/utils/constants.dart';
import 'package:covid_app2/components/helpers/ContactData.dart';
import 'package:covid_app2/objectbox.g.dart';
import 'package:covid_app2/screens/header_with_seachbox.dart';
import 'package:covid_app2/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:covid_app2/components/helpers/instance.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class PcrDetails extends StatefulWidget {
  QrCodeModel qr_code;
  Function setDataList;

  PcrDetails(this.qr_code, this.setDataList);

  @override
  _PcrDetailsState createState() => _PcrDetailsState();
}

class _PcrDetailsState extends State<PcrDetails> {

  String dropdownValue = 'dropdown_pcr'.tr;
  bool pcrResult = false;
  var resul = 'switch_neg'.tr;
  TextEditingController typeController = new TextEditingController();
  String? errorOthers = null;
  void toggleSwitch(bool pcr) {
    if (pcr == true) {
      setState(() {
        pcrResult = true;
        print("setting state to ");
        print(pcrResult);

        resul = 'switch_po'.tr;
      });
      // ignore: avoid_print
      print('switch_po'.tr);
    } else {
      setState(() {
        pcrResult = false;
        print("setting state to ");
        print(pcrResult);
        resul = 'switch_neg'.tr;
      });
      // ignore: avoid_print
      print('switch_neg'.tr);
    }
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
              TitleWithCustomUnderline2(text: 'subtitle14_validatepcr'.tr),
              const SizedBox(height: 10),
              SizedBox(
                height: 25,
              ),
              QrImage(
                data: widget.qr_code.content as String,
                size: 200,
                version: QrVersions.auto,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 20,
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'dropdown_pcr'.tr,
                  'dropdown_pass'.tr,
                  'dropdown_Certificate'.tr,
                  'Other'.tr,
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              (dropdownValue == 'dropdown_pcr'.tr)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SwitchScreen(),
                        Transform.scale(
                            scale: 2,
                            child: Switch(
                              value: pcrResult,
                              onChanged: (bool value) => toggleSwitch(value),
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            )),
                        Text(
                          '$resul',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 0,
                    ),
              (dropdownValue == 'Other'.tr)
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: TextField(
                        controller: typeController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Type of the imported document',
                            errorText: errorOthers),
                      ),
                    )
                  : SizedBox(
                      width: 0,
                    ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('button3_validate'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ))),
                ),
                onTap: () async {
                  print("before saving ");
                  print(pcrResult);

                  if (dropdownValue == 'Other'.tr) {
                    if (typeController.value.text.isEmpty) {
                      setState(() {
                        errorOthers = 'insert'.tr;
                      });
                    } else {
                      setState(() {
                        errorOthers = null;
                      });
                      widget.qr_code.type =
                          typeController.value.text.toString();
                    }
                  } else {
                    widget.qr_code.type = dropdownValue;
                  }

                  widget.qr_code.pcr = pcrResult;


                  print("printing from qr saving");
                  print(pcrResult);



                  if(pcrResult == true) {
                    //read data from object box to extract tokens
                    List<String> udids = [];
                    ContactData? cntdt= ContactData();
                    cntdt?.initData();

                    cntdt?.box.getAll().forEach(
                            (element) => udids.add(element.udid.toString()));
                    final response = await http.post(Uri.parse('$API_URL/notify'), body: {
                      'udids': udids,
                      //'device_name': await getDeviceId(),
                    }, headers: {
                      'Accept': 'application/json',
                    });

                    print("printing notify result body");
                    print(response.body);
                  }

                  qr_Data.box.put(widget.qr_code);

                  qr_Data.initData(widget.setDataList);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Wallet()));
                },
              )
            ]),
      ),
    );
  }
}

/*class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool pcrResult = false;
  String resul = 'switch_neg'.tr;

  void toggleSwitch(bool pcr) {
    if (pcr == true) {
      setState(() {
        pcrResult = true;
        print("setting state to ");
        print(pcrResult);

        resul = 'switch_po'.tr;
      });
      // ignore: avoid_print
      print('switch_po'.tr);
    } else {
      setState(() {
        pcrResult = false;
        print("setting state to ");
        print(pcrResult);
        resul = 'switch_neg'.tr;
      });
      // ignore: avoid_print
      print('switch_neg'.tr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 2,
          child: Switch(
            value: pcrResult,
            onChanged: (bool value) => toggleSwitch(value),
            activeColor: Colors.blue,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          )),
      Text(
        '$resul',
        style: TextStyle(fontSize: 20),
      )
    ]);
  }
}
*/

