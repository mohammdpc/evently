import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';
import 'package:evently/util.dart';

import '../Providers/settings_provider.dart';
import '../l10n/app_localizations.dart';

import '../General Widgets/event_card.dart';
import '../General Widgets/tab_card.dart';


class HomeScreen extends StatefulWidget {
  final List<Event> eventsList;
  const HomeScreen({super.key, required this.eventsList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> tabIconList = [
    allTab,
    sportsIcon,
    birthday,
    meeting,
    exhibition,
    bookClub,
  ];

  Widget page(int index){
    if(widget.eventsList.where((e)=>e.eventTypeIndex == index).isEmpty){
      return Center(child: Text('No Events Within this category'),);
    }
    return ListView(children: widget.eventsList.where((e)=>e.eventTypeIndex == index)
        .map(
          (e) => EventCard(
        eventIndex: widget.eventsList.indexOf(e),
        event: Event(
          title: e.title,
          description: e.description,
          eventDateAndTime: e.eventDateAndTime,
          eventTypeIndex: e.eventTypeIndex,
          favourite: e.favourite,
        ),
      ),
    )
        .toList(),);
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    List<String> tabTextList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.bookClub,
    ];
    return Column(
      spacing: heightOf(24, context),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcomBack,
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                  ),
                  Text(
                    setting.userName,
                    style: Theme.of(context).primaryTextTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset(
                    setting.theme ? sun : moon,
                    color: mainColor,
                  ),
                  onTap: () => setting.themeSwitch(),
                ),

                FilledButton(
                  onPressed: () => setting.languageSwitch(),
                  style: Theme.of(context).filledButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(
                      !setting.language ? input : mainColor,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    setting.language ? 'EN' : 'AR',
                    style: TextStyle(
                      color: setting.language ? Colors.white : mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(
          height: heightOf(40, context),
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => TabCard(
              index: index,
              selected: selectedIndex == index,
              icon: tabIconList[index],
              text: tabTextList[index],
              action: () => pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
            ),
            separatorBuilder: (context, index) =>
                SizedBox(width: widthOf(8, context)),
          ),
        ),
        Expanded(
          child: widget.eventsList.isNotEmpty
              ? PageView(
                  controller: pageController,
                  onPageChanged: (index) => setState(() {
                    selectedIndex = index;
                  }),
                  children: [
                    ListView(
                      children: widget.eventsList
                          .map(
                            (e) => EventCard(
                              eventIndex: widget.eventsList.indexOf(e),
                              event: Event(
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
                    page(0),
                    page(1),
                    page(2),
                    page(3),
                    page(4),
                  ],
                )
              : Center(child: Text('Add Event')),
        ),
      ],
    );
  }
}


