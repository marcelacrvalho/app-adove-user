import 'package:adove/app/data/models/event.dart';
import 'package:adove/app/data/notification/custom_notification.dart';
import 'package:adove/app/data/repositories/event.dart';
import 'package:adove/app/module/auth/controllers/auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  static ScheduleController get to => Get.find<ScheduleController>();
  final repository = Get.find<EventRepository>();

  late String dateFormatted;
  RxList<Event>? listEvents = <Event>[].obs;
  Rx<Event> currentEvent = Event().obs;

  @override
  void onInit() {
    events();
    super.onInit();
  }

  String dateString(String date) {
    DateTime dateParse = DateTime.parse(date);
    dateFormatted =
        DateFormat("dd 'de' MMMM 'de' yyy", 'pt_BR').format(dateParse);
    return dateFormatted;
  }

  Future events() async {
    final response =
        await repository.getEvents(AuthController.to.currentUser.value.id!);
    if (response != null) {
      listEvents!.value = response;
    }
  }

  Future cancel() async {
    await repository.deleteEvent(currentEvent.value.id!);
    CustomNotification.sendAndRetrieveMessage(
      'Infelizmente, o cliente desmarcou',
      'Você tem um horário vago. Que tal comer algo?',
      token: currentEvent.value.store!.firebaseToken,
    );
  }

  Future delete() async {
    await repository.deleteEvent(currentEvent.value.id!);
  }
}
