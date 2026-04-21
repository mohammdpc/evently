import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Main%20Screens/add_event_screen.dart';
import 'package:evently/Main%20Screens/favourite_screen.dart';
import 'package:evently/Main%20Screens/profile_screen.dart';
import 'package:evently/Providers/settings_provider.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Stream _usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(setting.userID)
      .collection('events')
      .snapshots();
  int navIndex = 0;

  void addEvent(Event e) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(setting.userID)
        .collection('events')
        .doc()
        .set(e.toJson());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          left: widthOf(16, context),
          right: widthOf(16, context),
          top: widthOf(16, context),
        ),
        child: StreamBuilder(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (navIndex != 2) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
            }
            final querySnapshot = snapshot.data as QuerySnapshot;

            final docs = querySnapshot.docs;


            List<Event> eventList = docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              String eventID = doc.id;
              return Event(
                eventID: eventID,
                title: data['title'],
                description: data['description'],
                eventDateAndTime: (data['dateTime'] as Timestamp).toDate(),
                eventTypeIndex: data['name'],
                favourite: data['favourite'],
              );
            }).toList();

            return [
              HomeScreen(eventsList: eventList),
              FavouriteScreen(eventList: eventList),
              ProfileScreen(),
            ][navIndex];
          },
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          useLegacyColorScheme: false,
          backgroundColor: setting.theme ? Colors.white : darkBackground,
          currentIndex: navIndex,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: mainColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: lightDisable,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                home,
                color: disableColor,
                width: widthOf(24, context),
              ),
              activeIcon: Image.asset(
                home,
                color: mainColor,
                width: widthOf(24, context),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                heart,
                color: disableColor,
                width: widthOf(24, context),
              ),
              activeIcon: Image.asset(
                filledHeart,
                color: mainColor,
                width: widthOf(24, context),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                profile,
                color: disableColor,
                width: widthOf(24, context),
              ),
              activeIcon: Image.asset(
                profile,
                color: mainColor,
                width: widthOf(24, context),
              ),
              label: 'profile',
            ),
          ],
          onTap: (index) => setState(() {
            navIndex = index;
          }),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        shape: CircleBorder(),
        onPressed: () => Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => AddEventScreen(action: addEvent),
          ),
        ),
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
          weight: widthOf(24, context),
        ),
      ),
    );
  }
}
