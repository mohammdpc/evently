import 'package:evently/General%20Widgets/filled_text_button.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/material.dart';
import 'package:evently/util.dart';
import 'package:intl/intl.dart';
import '../General Widgets/tab_card.dart';
import '../General Widgets/input_field.dart';
import '../General Widgets/link_text.dart';
import '../General Widgets/custom_back_button.dart';
import '../General Widgets/vertical_separator.dart';

import '../Providers/settings_provider.dart';
import '../l10n/app_localizations.dart';

class AddEventScreen extends StatefulWidget {
  final void Function(Event ev) action;
  final Event? e;
  const AddEventScreen({super.key, required this.action, this.e});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<String> tabIconList = [
    sportsIcon,
    birthday,
    meeting,
    exhibition,
    bookClub,
  ];

  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController ;
  late TextEditingController descriptionController;

  int eventTypeIndex = 0;
  int selectedIndex = 0;

  DateTime? date;
  TimeOfDay? time;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    if (widget.e != null) {
      eventTypeIndex = widget.e!.eventTypeIndex;
      selectedIndex = widget.e!.eventTypeIndex;
      date = widget.e!.eventDateAndTime.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        microsecond: 0,
        millisecond: 0,
      );
      time = TimeOfDay.fromDateTime(widget.e!.eventDateAndTime);
      titleController.text = widget.e!.title;
      descriptionController.text = widget.e!.description;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabTextList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.bookClub,
    ];

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          minimum: EdgeInsets.all(widthOf(16, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(action: () => Navigator.pop(context)),
                  Text('Add Event'),
                  SizedBox(
                    width: screenWidth(context) * 0.085333333,
                    height: screenWidth(context) * 0.085333333,
                  ),
                ],
              ),

              VerticalSpacer(h: 16),

              Container(
                height: heightOf(193, context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      setting.theme
                          ? eventImageLightList[eventTypeIndex]
                          : eventImageDarkList[eventTypeIndex],
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: BoxBorder.all(color: stroke),
                ),
              ),

              VerticalSpacer(h: 16),

              SizedBox(
                height: heightOf(40, context),
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TabCard(
                    index: index,
                    selected: selectedIndex == index,
                    icon: tabIconList[index],
                    text: tabTextList[index],
                    action: () => setState(() {
                      selectedIndex = index;
                      eventTypeIndex = index;
                    }),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: widthOf(8, context)),
                ),
              ),

              VerticalSpacer(h: 16),

              Text('Title'),

              VerticalSpacer(h: 8),

              InputField(
                hintText: 'Event Title',
                validator: (v) => v == null || v.isEmpty ? 'Add Title' : null,
                controller: titleController,
              ),

              VerticalSpacer(h: 16),

              Text('Description '),

              VerticalSpacer(h: 8),

              Expanded(
                child: InputField(
                  hintText: 'Event Description....',
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Add Description' : null,
                  controller: descriptionController,
                  expand: true,
                ),
              ),

              VerticalSpacer(h: 16),

              Row(
                children: [
                  SizedBox(
                    width: widthOf(24, context),
                    child: Image.asset(meeting),
                  ),
                  Text('Event Date'),
                  Spacer(),
                  LinkText(
                    text: date == null
                        ? 'Choose date'
                        : DateFormat.yMMMMd('en_US').format(date!),
                    action: () async {
                      date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 3652)),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),

              VerticalSpacer(h: 16),

              Row(
                children: [
                  SizedBox(
                    width: widthOf(24, context),
                    child: Image.asset(exhibition),
                  ),
                  Text('Event Time'),
                  Spacer(),
                  LinkText(
                    text: time == null ? 'Choose time' : time.toString(),
                    action: () async {
                      time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      setState(() {});
                    },
                  ),
                ],
              ),

              VerticalSpacer(h: 16),

              FilledTextButton(
                action: () {
                  if (_formKey.currentState!.validate()) {
                    if (date != null && time != null) {
                      widget.action(
                        Event(
                          eventID: widget.e == null? '-1':widget.e!.eventID,
                          title: titleController.text,
                          description: descriptionController.text,
                          eventDateAndTime: date!.add(
                            Duration(hours: time!.hour, minutes: time!.minute),
                          ),
                          eventTypeIndex: eventTypeIndex,
                          favourite: false,
                        ),
                      );
                    }
                  }
                },
                text: widget.e == null?'Add Event':'Update event',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
