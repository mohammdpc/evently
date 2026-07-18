import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  late final String eventID;
  late String title;
  late String description;
  late DateTime eventDateAndTime;
  late int eventTypeIndex;
  late bool favourite;

  Event({
    required this.title,
    required this.description,
    required this.eventDateAndTime,
    required this.eventTypeIndex,
    required this.favourite,
    required this.eventID
  });

  Event.formMap(Map<String, dynamic> data, this.eventID) {
    title = data['Event Title'];
    description = data['Event Description'];
    eventTypeIndex = data['Event Name'];
    eventDateAndTime = data['Event DateTime'];
    favourite = data['is favourite'];
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': Timestamp.fromDate(eventDateAndTime),
      'description': description,
      'favourite': favourite,
      'name': eventTypeIndex,
      'title': title,
    };
  }

  Event.fromJson(Map<String, dynamic> data) {
    eventTypeIndex = data['name'];
    title = data['title'];
    description = data['description'];
    favourite = data['favourite'];
    eventDateAndTime = data['dateTime'].toDate();
  }
}
