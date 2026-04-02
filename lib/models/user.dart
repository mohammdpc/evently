import 'event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String userID;
  String userName = '';
  List<Event>? events = [];
  final db = FirebaseFirestore.instance;

  UserModel({required this.userID, this.userName = '',this.events}) {
    //'events':{}
    userName.isEmpty?getUserData():null;
  }

  UserModel.newUser({required this.userID, required this.userName}) {
    db.collection('users').doc(userID).set({
      'User Name': userName
    });
  }

  void getUserData() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await db
        .collection('users')
        .doc(userID)
        .get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    userName = data['User Name'];
    /*
    data = data['events'];
    for (int i = 1; i <= data.length; i++) {
      events.add(
        Event(
          title: data[i.toString()]['Event Title'],
          description: data[i.toString()]['Event Description'],
          eventDateAndTime: data[i.toString()]['Event DateTime'],
          eventTypeIndex: data[i.toString()]['Event Type Index'],
          favourite: data[i.toString()]['Is Favourite'],
        ),
      );
    }*/
  }

  void addEvent(Event e) {
    //db.collection('users').
  }
}
