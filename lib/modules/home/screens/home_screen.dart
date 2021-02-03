import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../application/values/application_colors.dart';
import 'favorites/favorites_screen.dart';
import 'map/map_screen.dart';
import 'pre_login/pre_login_screen.dart';
import 'schedules/schedules_screen.dart';
import 'search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> _tabs;
  int selectedIndex = 2;

  final _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();

    _tabs = <Widget>[
      PageStorage(
        bucket: _bucket,
        child: SearchScreen(
          key: PageStorageKey('search-screen'),
          controller: Get.find(),
        ),
      ),
      SchedulesScreen(
        authenticationController: Get.find(),
        controller: Get.find(),
      ),
      MapScreen(
        controller: Get.find(),
        onPressedSearch: () {
          setState(() {
            selectedIndex = 0;
          });
        },
      ),
      FavoritesScreen(
        authenticationController: Get.find(),
        controller: Get.find(),
      ),
      PreLoginScreen(
        controller: Get.find(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: ApplicationColors.lightGrey,
      body: _tabs[selectedIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 10,
        snakeShape: SnakeShape.circle,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ScreenUtil().setHeight(25)),
            topRight: Radius.circular(ScreenUtil().setHeight(25)),
          ),
        ),
        snakeViewColor: ApplicationColors.accent,
        unselectedItemColor: ApplicationColors.grey,
        selectedItemColor: ApplicationColors.white,
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.calendar),
            label: 'agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.heart),
            label: 'favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            label: 'perfil',
          )
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
