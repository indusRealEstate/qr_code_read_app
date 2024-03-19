import 'dart:convert';

class ClientModel {
  final String id;
  final String uid;
  final String name;
  final String email;
  final String contactNo;
  final String source;
  final DateTime timestamp;
  final String qrCodeRead;
  final String readBy;

  ClientModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.contactNo,
    required this.source,
    required this.timestamp,
    required this.qrCodeRead,
    required this.readBy,
  });

  factory ClientModel.fromJson(String str) =>
      ClientModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        contactNo: json["contact_no"],
        source: json["source"],
        timestamp: DateTime.parse(json["timestamp"]),
        qrCodeRead: json["qr_code_read"],
        readBy: json["read_by"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "name": name,
        "email": email,
        "contact_no": contactNo,
        "source": source,
        "timestamp": timestamp.toIso8601String(),
        "qr_code_read": qrCodeRead,
        "read_by": readBy,
      };
}
