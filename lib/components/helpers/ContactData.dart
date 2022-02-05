// ignore_for_file: avoid_init_to_null

import 'package:covid_app2/components/helpers/ObjecBox.dart';
import 'package:covid_app2/model/qr_model.dart';
import 'package:covid_app2/nearby/contact_model.dart';
import 'package:covid_app2/objectbox.g.dart';

class ContactData {
  List<ContactModel> contactDataList = [];
  var box = null;

  Future<void> initData() async {
    contactDataList = [];
    if (box == null) {
      box = ObjectBox.store.box<ContactModel>();
    }

    contactDataList.addAll(box.getAll());

  }
}
