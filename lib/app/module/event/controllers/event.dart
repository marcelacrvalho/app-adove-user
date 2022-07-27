import 'package:adove/app/data/models/hour.dart';
import 'package:adove/app/data/repositories/event.dart';
import 'package:adove/app/data/repositories/hour.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:adove/app/module/event/views/confirmation.dart';
import 'package:adove/app/module/home/controllers/bottom_bar.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventController extends GetxController {
  static EventController get to => Get.put(EventController());
  final hourRepository = Get.find<HourRepository>();
  final repository = Get.find<EventRepository>();

  // HOUR
  RxList<Hour> listHour = <Hour>[].obs;
  Rx<Hour> currentHour = Hour().obs;

  // DATE
  final datePickerController = DatePickerController();
  Rx<DateTime> currentDate = DateTime.now().obs;

  Future hours() async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(currentDate.value);

    final response = await hourRepository.getHours(
      JobController.to.currentJob.value.store!.id!,
      formatted,
    );
    if (response != null) {
      listHour.value = response;
    }
  }

  void toConfirmation(Hour hour) {
    currentHour.value = hour;
    Get.to(
      () => const ConfirmationView(),
      transition: Transition.zoom,
      curve: Curves.bounceIn,
      duration: const Duration(milliseconds: 500),
    );
  }

  Future createEvent() async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(currentDate.value);
    final response = await repository.newEvent(
      AuthController.to.currentUser.value.id!,
      JobController.to.currentJob.value.store!.id!,
      JobController.to.currentJob.value.id!,
      currentHour.value.id!,
      formatted,
    );

    if (response == null) {
      Get.snackbar(
        'Não deu para marcar :(',
        'Tente novamente em alguns segundos ou escolha outro horário',
        margin: EdgeInsets.only(
          top: Get.mediaQuery.size.height * 0.03,
          left: 4.0,
          right: 4.0,
        ),
        borderRadius: 7.0,
      );
    } else {
      toScheduleView();
    }
  }

  void toScheduleView() {
    BottomBarController.to.index = 0;
    BottomBarController.to.currentColor = BottomBarController.to.labelColor[0];
    Get.toNamed(Routes.kBottomBar);
    Get.delete<HourRepository>();
    Get.delete<EventController>();
    Get.snackbar(
      'Horário marcado com sucesso',
      'Agora, é só aguardar :)',
      margin: EdgeInsets.only(
        top: Get.mediaQuery.size.height * 0.03,
        left: 4.0,
        right: 4.0,
      ),
      borderRadius: 7.0,
    );
  }
}
