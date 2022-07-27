import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/event/controllers/event.dart';
import 'package:adove/app/module/event/widgets/calendar.dart';
import 'package:adove/app/module/event/widgets/card_hour.dart';
import 'package:adove/app/module/event/widgets/icon_back.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const IconBackEventWidget(),
            const Divider(),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: JobController.to.currentJob.value.store!.name!,
                fontSize: kH2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: JobController.to.currentJob.value.job!,
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: JobController.to.currentJob.value.store!.homecare == true
                    ? 'Vai até a sua casa'
                    : 'Consultório próprio',
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: JobController.to.currentJob.value.store!.open!,
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            const Divider(),
            const CalendarEventWidget(),
            const Divider(),
            Expanded(
                child: FutureBuilder(
              future: EventController.to.hours(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Lottie.asset(
                        'assets/animations/animation-loading.json');
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return const CardHourEventWidget();
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
