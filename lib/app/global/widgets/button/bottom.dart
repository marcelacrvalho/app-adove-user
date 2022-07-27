import 'package:adove/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.black;

  List<NavigationItem> items = [
    NavigationItem(
        const Icon(LineIcons.calendar), const Text('AGENDA')),
    NavigationItem(
        const Icon(LineIcons.home), const Text('INÍCIO')),
    NavigationItem(
        const Icon(LineIcons.user), const Text('PERFIL')),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? const EdgeInsets.only(left: 16, right: 16) : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.grey,
                ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      width: MediaQuery.of(context).size.width,
      child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  choiceIndex(itemIndex);
                },
                child: _buildItem(item, selectedIndex.value == itemIndex),
              );
            }).toList(),
          ),
      ),
    );
  }

  void choiceIndex(int index) {
    selectedIndex.value = index;

    if(selectedIndex.value == 0) {
      Get.toNamed(Routes.kSchedule);
    } else if(selectedIndex.value == 1) {
      Get.toNamed(Routes.kHome);
    }
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
