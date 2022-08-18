import 'package:adove/app/module/auth/bindigs/auth.dart';
import 'package:adove/app/module/auth/views/address.dart';
import 'package:adove/app/module/auth/views/auth.dart';
import 'package:adove/app/module/event/bindings/event.dart';
import 'package:adove/app/module/event/views/confirmation.dart';
import 'package:adove/app/module/event/views/event.dart';
import 'package:adove/app/module/home/bindings/botom_bar.dart';
import 'package:adove/app/module/home/bindings/home.dart';
import 'package:adove/app/module/home/bindings/profile.dart';
import 'package:adove/app/module/home/bindings/schedule.dart';
import 'package:adove/app/module/home/views/bottom_bar.dart';
import 'package:adove/app/module/home/views/home.dart';
import 'package:adove/app/module/home/views/profile.dart';
import 'package:adove/app/module/home/views/schedule.dart';
import 'package:adove/app/module/initial/bindings/initial.dart';
import 'package:adove/app/module/initial/views/initial.dart';
import 'package:adove/app/module/job/bindings/job.dart';
import 'package:adove/app/module/job/views/dynamic_link_job.dart';
import 'package:adove/app/module/job/views/job.dart';
import 'package:adove/app/module/job/views/search_job.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.kInitial,
      page: () => const InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.kAuth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.kAddress,
      page: () => const AddressView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.kHome,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.kBottomBar,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: Routes.kSchedule,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.kProfile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.kJob,
      page: () => const JobView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.kSearchJob,
      page: () => const SearchJobView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.kEvent,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: Routes.kConfirmEvent,
      page: () => const ConfirmationView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: Routes.kDynamicLinkJob,
      page: () => const DynamicLinkJobsView(),
      binding: JobBinding(),
    ),
  ];
}
