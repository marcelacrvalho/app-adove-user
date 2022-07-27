import 'package:adove/app/global/widgets/text/title.dart';
import 'package:adove/app/routes/app_routes.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HeaderTextWidget extends StatelessWidget {
  final bool visibleSearchIcon;
  final bool visibleTitle;

  const HeaderTextWidget({Key? key,
    this.visibleSearchIcon = false,
    this.visibleTitle = true,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  LineIcons.arrowLeft,
                  size: Get.size.height * 0.035,
                  color: appThemeData.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: toSearchJob,
                  child: Visibility(
                    visible: visibleSearchIcon,
                    child: Icon(
                      Icons.search_rounded,
                      size: Get.size.height * 0.03,
                      color: appThemeData.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: TitleTextWidget(title: 'adove'),
          ),
        ),
      ],
    );
  }

  void toSearchJob () {
    Get.toNamed(Routes.kSearchJob);
  }
}