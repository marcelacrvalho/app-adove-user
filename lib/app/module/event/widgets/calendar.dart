import 'package:adove/app/module/event/controllers/event.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarEventWidget extends StatelessWidget {
  const CalendarEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        controller: EventController.to.datePickerController,
        height: Get.mediaQuery.size.height * 0.15,
        selectionColor: appThemeData.primaryColor,
        selectedTextColor: appThemeData.scaffoldBackgroundColor,
        locale: 'pt_BR',
        onDateChange: (date) {
          EventController.to.currentDate.value = date;
          EventController.to.hours();
        },
      ),
    );
  }
}
