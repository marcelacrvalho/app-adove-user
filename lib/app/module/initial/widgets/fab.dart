import 'package:adove/app/global/widgets/button/fab.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FabInitialWidget extends StatelessWidget {
  final void Function() onPressed;

  const FabInitialWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButtonWidget(
            onPressed: onPressed,
            color: appThemeData.primaryColor,
            buttonIcon: LineIcons.arrowRight,
          ),
        ],
      ),
    );
  }
}
