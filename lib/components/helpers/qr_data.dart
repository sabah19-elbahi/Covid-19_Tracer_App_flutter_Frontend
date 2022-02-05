// ignore_for_file: avoid_init_to_null

import 'package:covid_app2/model/qr_model.dart';
import 'package:covid_app2/objectbox.g.dart';

import 'ObjecBox.dart';

class QrData {
  List<QrCodeModel> qrCodeList = [];
  var box = null;


  Future<void> initData(Function setDataList) async {
    qrCodeList = [];
    if (box == null) {

      box = ObjectBox.store.box<QrCodeModel>();
    }

    qrCodeList.addAll(box.getAll());

    setDataList(qrCodeList);

  }
}
