import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/button/elevated.dart';
import 'package:adove/app/global/widgets/button/flat.dart';
import 'package:adove/app/module/event/controllers/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationView extends GetView<EventController> {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset('assets/gifs/client-bg-schedule.gif'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButtonWidget(
                  onTap: () => Get.back(),
                  buttonText: 'Cancelar',
                  fontSize: kH2,
                ),
              ),
              const Divider(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButtonWidget(
                  onTap: EventController.to.createEvent,
                  height: kBigButton,
                  buttonText: 'Marcar horário',
                  fontSize: kH2,
                  buttonColor: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
