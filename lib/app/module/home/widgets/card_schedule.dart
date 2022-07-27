import 'package:adove/app/data/models/event.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/home/controllers/schedule.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSchedule extends StatelessWidget {
  final Event event;

  const CardSchedule(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(),
          _alignDate(),
          const Divider(),
          Column(
            children: [_cardInfo()],
          ),
        ],
      ),
    );
  }

  Widget _cardInfo() {
    return Tooltip(
      message: '${event.job!.job}, as ${event.hour!.hour}',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _containerHour(),
          Expanded(
            child: GestureDetector(
              onDoubleTap: () async {
                ScheduleController.to.currentEvent.value = event;
                ScheduleController.to.listEvents!.remove(event);
                ScheduleController.to.delete();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey.shade300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: event.store!.name!,
                      fontSize: kH2,
                      fontColor: kPurpleDark,
                    ),
                    TextWidget(
                      text: event.job!.job!,
                      fontSize: kH3,
                      fontColor: Colors.grey,
                    ),
                    const Divider(),
                    TextWidget(
                      text: '${event.store!.street},',
                      fontSize: kH3,
                      fontColor: kPurpleDark,
                    ),
                    TextWidget(
                      text:
                          '${event.store!.neighborhood}, ${event.store!.number}',
                      fontSize: kH3,
                      fontColor: kPurpleDark,
                    ),
                    TextWidget(
                      text: event.store!.payment!,
                      fontSize: kH3,
                      fontColor: Colors.grey,
                    ),
                    const Divider(),
                    const Divider(color: Colors.grey),
                    _price(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alignDate() {
    return Align(
      alignment: Alignment.topLeft,
      child: TextWidget(
        text: ScheduleController.to.dateString(event.date!),
        fontSize: kH2,
        fontColor: Colors.grey,
      ),
    );
  }

  Widget _containerHour() {
    return Container(
      padding: const EdgeInsets.all(16.00),
      width: Get.mediaQuery.size.width * 0.25,
      child: TextWidget(
        text: event.hour!.hour!,
        fontSize: kH2,
      ),
    );
  }

  Widget _price() {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextWidget(
        text: 'R\$ ${event.job!.price!}',
        fontSize: kH2,
        fontColor: appThemeData.primaryColor,
        isBold: true,
      ),
    );
  }
}
