import 'package:adove/app/data/models/job.dart';
import 'package:adove/app/global/helpers/constraints.dart';
import 'package:adove/app/global/widgets/text/text.dart';
import 'package:adove/app/module/job/controllers/job.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerJobWidget extends GetView<JobController> {
  final Job currentJob;

  const ContainerJobWidget(this.currentJob, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: currentJob.job!,
      child: GestureDetector(
        onTap: () => JobController.to.toEventView(currentJob),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Container(
            width: double.infinity,
            height: Get.mediaQuery.size.height * 0.28,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: appThemeData.primaryColor.withOpacity(0.3),
              border: currentJob.store!.homecare == true
                  ? Border.all(
                      color: Colors.deepOrange.shade600,
                      width: 3.0,
                    )
                  : Border.all(
                      color: appThemeData.primaryColor,
                      width: 3.0,
                    ),
            ),
            child: Column(
              children: [
                TextWidget(
                    text: currentJob.job!,
                    fontSize: kH2,
                    fontFamily: 'Made',
                    fontColor: kBlue,
                  ),
                Container(
                    width: double.infinity,
                    height: Get.mediaQuery.size.height * 0.14,
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: currentJob.description!,
                      fontSize: kH2,
                      isCenter: true,
                    ),
                  ),
                Divider(
                  color: appThemeData.primaryColor,
                  endIndent: 4.0,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextWidget(
                      text: 'R\$ ${currentJob.price}',
                      fontSize: kH2,
                      fontFamily: 'Made',
                      fontColor: kOrangeDark,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
