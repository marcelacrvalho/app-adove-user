import 'package:adove/app/module/job/bindings/job.dart';
import 'package:adove/app/module/job/views/dynamic_link_job.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class CustomDynamicLinks {
  static Future retrieveDynamicLink() async {
    await Firebase.initializeApp();
    var data = await FirebaseDynamicLinks.instance.getInitialLink();
    var deepLink = data?.link;
    final queryParams = deepLink?.queryParameters;
    final queryId = queryParams?['id'];

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      if (deepLink != null && queryId != null && queryId.isNotEmpty) {
        int id = int.parse(queryId);
        Get.to(
          DynamicLinkJobsView(
            id: id,
          ),
          binding: JobBinding(),
        );
      }
    }).onError((error) {});
  }
}
