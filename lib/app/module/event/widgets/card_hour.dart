import 'package:adove/app/data/models/hour.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/event/controllers/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardHourEventWidget extends StatelessWidget {
  const CardHourEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: EventController(),
      initState: (_) => EventController.to.hours(),
      didUpdateWidget: (_, __) => EventController.to.hours(),
      autoRemove: true,
      builder: (_) => EventController.to.listHour.isNotEmpty
          ? _listHour()
          : const Center(
              child: TextWidget(
                text:
                    'Todos os horários estão ocupados. Que tal escolher outro dia?',
                fontSize: kH2,
                fontColor: Colors.grey,
                isCenter: true,
              ),
            ),
    );
  }

  Widget _listHour() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: EventController.to.listHour.length,
        itemBuilder: (context, index) {
          return _cardHour(EventController.to.listHour[index]);
        });
  }

  Widget _cardHour(Hour hour) {
    return Tooltip(
      message: hour.hour!,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: Get.mediaQuery.size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: hour.hour!,
              fontSize: kH2,
              isCenter: true,
            ),
            _containerStatus(hour),
          ],
        ),
      ),
    );
  }

  Widget _containerStatus(Hour hour) {
    return GestureDetector(
      onTap: () => EventController.to.toConfirmation(hour),
      child: Container(
        color: Colors.grey.shade100,
        alignment: Alignment.topRight,
        width: Get.mediaQuery.size.width * 0.7,
        child: Center(
          child: TextWidget(
            text: 'Disponível',
            fontSize: kH2,
            fontColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
