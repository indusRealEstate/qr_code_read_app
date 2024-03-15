import 'package:hive/hive.dart';

part 'vcard.g.dart';

@HiveType(typeId: 1)
class VCardHive {
  VCardHive({
    required this.uid,
    required this.name,
    required this.email,
    required this.contactNo,
  });

  @HiveField(0)
  String uid;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String contactNo;
}
