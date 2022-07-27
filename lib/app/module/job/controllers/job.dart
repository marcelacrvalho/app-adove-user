import 'package:adove/app/data/models/job.dart';
import 'package:adove/app/data/repositories/job.dart';
import 'package:adove/app/module/home/controllers/home.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  static JobController get to => Get.find();
  final repository = Get.find<JobRepository>();

  Rx<Job> currentJob = Job().obs;
  RxList<Job>? listJob = <Job>[].obs;
  RxList<Job>? listSearchJob = <Job>[].obs;

  Rx<String> inputSearchJob = ''.obs;

  changeJob(Job job) {
    currentJob.update((val) {
      val!.id = job.id;
      val.job = job.job;
      val.description = job.description;
      val.price = job.price;
      val.store = job.store;
    });
  }

  void toEventView(Job job) {
    changeJob(job);
    Get.toNamed(Routes.kEvent);
  }

  void toSearchJobView() {
    Get.toNamed(Routes.kSearchJob);
  }

  Future jobs() async {
    var response = await repository.getJobs(
      HomeController.to.localizationController.text,
      HomeController.to.currentCategory.value,
    );
    if (response != null) {
      listJob!.value = response;
    }
  }

  Future search() async {
    var response = await repository.getJobsSearch(
        inputSearchJob.value, HomeController.to.localizationController.text);
    if (response != null) {
      listSearchJob!.value = response;
    }
  }
}
