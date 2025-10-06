import 'package:evently/core/resources/route_manager.dart';
import 'package:evently/core/widgets/navigation_bar_icon_widget.dart';
import 'package:evently/features/main_layout/favorite_body/favorite_widget.dart';
import 'package:evently/features/main_layout/home_body/home_widget.dart';
import 'package:evently/features/main_layout/map_body/map_widget.dart';
import 'package:evently/features/main_layout/profile_body/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

  late final List<Widget> _tabs;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [HomeWidget(), MapWidget(), FavoriteWidget(), ProfileWidget()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _tabs[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, RouteManager.createEvent),
        child: Icon(Icons.add_rounded, size: 35.sp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationBarIconWidget(
              currentSelectedIndex: _selectedIndex,
              iconIndex: 0,
              selectedIcon: Icons.home_rounded,
              unSelectedIcon: Icons.home_outlined,
              iconCallback: _changeSelectedIndex,
            ),
            NavigationBarIconWidget(
              currentSelectedIndex: _selectedIndex,
              iconIndex: 1,
              selectedIcon: Icons.location_on_rounded,
              unSelectedIcon: Icons.location_on_outlined,
              iconCallback: _changeSelectedIndex,
            ),
            NavigationBarIconWidget(
              currentSelectedIndex: _selectedIndex,
              iconIndex: 2,
              selectedIcon: Icons.favorite_rounded,
              unSelectedIcon: Icons.favorite_outline_rounded,
              iconCallback: _changeSelectedIndex,
            ),
            NavigationBarIconWidget(
              currentSelectedIndex: _selectedIndex,
              iconIndex: 3,
              selectedIcon: Icons.person_rounded,
              unSelectedIcon: Icons.person_outline_rounded,
              iconCallback: _changeSelectedIndex,
            ),
          ],
        ),
      ),
    );
  }

  void _changeSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    setState(() {});
  }
}
