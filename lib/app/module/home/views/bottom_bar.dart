import 'package:adove/app/module/home/controllers/bottom_bar.dart';
import 'package:adove/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: BottomBarController.to.index,
        backgroundColor: appThemeData.scaffoldBackgroundColor,
        onTap: (index) {
          setState(() {
            BottomBarController.to.index = index;
            BottomBarController.to.currentColor = BottomBarController.to.labelColor[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BottomBarController.to.currentColor,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.calendar),
            label: 'AGENDA',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
            label: 'INÍCIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: 'PERFIL',
          ),
        ],  
    ),
    body: BottomBarController.to.pages[BottomBarController.to.index],
    );
  }
}