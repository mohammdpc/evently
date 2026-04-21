import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/General%20Widgets/custom_back_button.dart';
import 'package:evently/Main%20Screens/add_event_screen.dart';
import 'package:evently/Providers/settings_provider.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: heightOf(16, context),
          children: [
            Row(
              spacing: widthOf(8, context),
              children: [
                CustomBackButton(action: () => Navigator.pop(context)),
                SizedBox(width: widthOf(32, context)),
                Expanded(
                  child: Text(
                    'Event details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      color: mainText,
                    ),
                  ),
                ),
                CustomBackButton(
                  icon: Image.asset(editIcon),
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddEventScreen(action: (e) {
                              FirebaseFirestore.instance.collection('users').doc(setting.userID).collection('events').doc(e.eventID).set(e.toJson());
                              Navigator.pop(context);
                            }, e: event),
                      ),
                    );
                  },
                ),
                CustomBackButton(
                  icon: Image.asset(trashIcon),
                  action: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(setting.userID)
                        .collection('events')
                        .doc(event.eventID)
                        .delete();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Container(
              height: heightOf(193, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    setting.theme
                        ? eventImageLightList[event.eventTypeIndex]
                        : eventImageDarkList[event.eventTypeIndex],
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: BoxBorder.all(color: stroke),
              ),
            ),
            Text(
              event.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: mainText,
                decoration: TextDecoration.none,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: input,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: BoxBorder.all(color: stroke),
                ),
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: widthOf(16, context),
                  vertical: heightOf(8, context),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: Container(
                    padding: EdgeInsets.all(widthOf(10, context)),
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: BoxBorder.all(color: stroke),
                    ),
                    child: Image.asset(calender, width: widthOf(24, context)),
                  ),
                  title: Text(
                    DateFormat('d MMMM').format(event.eventDateAndTime),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: mainText,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('hh:mm a').format(event.eventDateAndTime),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: disableColor,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: mainText,
                decoration: TextDecoration.none,
              ),
            ),
            Container(
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: input,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: BoxBorder.all(color: stroke),
              ),
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: widthOf(16, context),
                vertical: heightOf(8, context),
              ),
              child: Text(
                event.description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: mainText,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
