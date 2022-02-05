import 'package:objectbox/objectbox.dart';

@Entity()
class QrCodeModel {
  @Id()
  int id;

  String? content;

  String? type;

  bool? pcr;

  @Property(type: PropertyType.date)
  DateTime date;

  QrCodeModel(
      {this.content,
      this.pcr,
      required this.date,
      this.type,
      required this.id});
}

@Entity()
class ContactModel {
  @Id()
  int id = 0;

  String? fcm_token;
  String? udid;



  @Property(type: PropertyType.date)
  DateTime? date;

  int? notPersisted;
  ContactModel(
      {
        this.date,
        this.udid,
        this.fcm_token,
        required this.id});



}
