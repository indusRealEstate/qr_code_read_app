import 'dart:convert';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final String image;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.image,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory EventModel.fromJson(String str) =>
      EventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        image: json["image"],
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "location": location,
        "image": image,
        "date": date.toIso8601String(),
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
      };
}
