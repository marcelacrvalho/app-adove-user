import 'package:adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  const TitleTextWidget({Key? key, this.title = 'adove'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: TextWidget(
        text: title.toLowerCase(),
        fontSize: 33.0,
        fontFamily: 'Made',
        fontColor: Colors.grey,
      ),
    );
  }
}
