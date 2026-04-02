import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import 'package:intl/intl.dart';
import '../Providers/settings_provider.dart';
import '../models/event.dart';
import 'info_container.dart';

class EventCard extends StatefulWidget {
  final int eventIndex;
  final Event event;
  const EventCard({
    super.key,
    required this.eventIndex,
    required this.event,
  });

  int get evenTypeIndex=>event.eventTypeIndex;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  Timestamp t = Timestamp(1770968755, 491000000);
  DateTime d = DateTime(2026,2,16,9,45,55);
  @override
  Widget build(BuildContext context) {
    debugPrint('\n\n ${t.toDate()} \n\n');
    return InkResponse(

      child: Container(
        padding: EdgeInsets.all(8),
        height: heightOf(193, context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              setting.theme
                  ? eventImageLightList[widget.event.eventTypeIndex]
                  : eventImageDarkList[widget.event.eventTypeIndex],
            ),
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: BoxBorder.all(color: stroke),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoContainer(
              borderColor: stroke,
              fill: background,
              child: Text(
                DateFormat('d MMM').format(widget.event.eventDateAndTime),
              ),
            ),
            InfoContainer(
              borderColor: stroke,
              fill: background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.event.description),
                  InkResponse(
                    onTap: () async {
                      setState(() {
                        widget.event.favourite = !widget.event.favourite;
                      });
                      debugPrint('\n\n ${widget.event.eventID} \n\n');
                      try {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(setting.userID)
                            .collection('events')
                            .doc(widget.event.eventID)
                            .update({'favourite': widget.event.favourite});
                        debugPrint('Favourite updated successfully');
                      } catch (e) {
                        debugPrint('\n\nFailed to update favourite: $e \n\n');
                      }
                    },
                    child: Image.asset(
                      !widget.event.favourite ? heart : filledHeart,
                      width: widthOf(24, context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
