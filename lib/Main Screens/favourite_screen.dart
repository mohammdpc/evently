import 'package:evently/General Widgets/event_card.dart';
import 'package:evently/General Widgets/input_field.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import "package:evently/models/event.dart";

class FavouriteScreen extends StatefulWidget {
  final List<Event> eventList;
  const FavouriteScreen({super.key, required this.eventList});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late TextEditingController searchController;
  bool isSearching = false;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Event>? favouriteEventsList = widget.eventList
        .where((e) => e.favourite)
        .toList();

    List<Event>? searchEventsList = widget.eventList
        .where(
          (e) =>
              e.title.contains(searchController.text) ||
              e.description.contains(searchController.text),
        )
        .toList();
    return SafeArea(
      child: Column(
        spacing: heightOf(16, context),
        children: [
          InputField(
            hintText: AppLocalizations.of(context)!.searchForEvent,
            onChange: () {
              searchEventsList = widget.eventList
                  .where(
                    (e) =>
                e.title.contains(searchController.text) ||
                    e.description.contains(searchController.text),
              )
                  .toList();
              setState(() {
                isSearching = searchController.text.isNotEmpty;
              });
            },
            validator: (s) {},
            controller: searchController,
            suffix:Padding(
              padding: EdgeInsets.symmetric(horizontal:widthOf(16, context),vertical: heightOf(12, context)),
              child: Image.asset(searchIcon,width: widthOf(24, context),),
            ),
          ),
          isSearching
              ? searchEventsList!.isNotEmpty
                    ? Expanded(
                        child: ListView(
                          children: searchEventsList!
                              .map(
                                (e) => EventCard(
                                  eventIndex: searchEventsList!.indexOf(e),
                                  event: Event(
                                    eventID: e.eventID,
                                    title: e.title,
                                    description: e.description,
                                    eventDateAndTime: e.eventDateAndTime,
                                    eventTypeIndex: e.eventTypeIndex,
                                    favourite: e.favourite,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    : Center(child: Text(AppLocalizations.of(context)!.noEventFound))
              : favouriteEventsList.isNotEmpty
              ? Expanded(
                  child: ListView(
                    children: favouriteEventsList
                        .map(
                          (e) => EventCard(
                            eventIndex: favouriteEventsList.indexOf(e),
                            event: Event(
                              eventID: e.eventID,
                              title: e.title,
                              description: e.description,
                              eventDateAndTime: e.eventDateAndTime,
                              eventTypeIndex: e.eventTypeIndex,
                              favourite: e.favourite,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : Center(child: Text(AppLocalizations.of(context)!.addEventsToFavourite)),
        ],
      ),
    );
  }
}
