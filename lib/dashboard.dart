import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clinic/screens/health%20record/panel_records.dart';
import 'package:flutter_clinic/screens/health%20record/prescription_screen.dart';
import 'package:flutter_clinic/record_screen.dart';
import 'package:flutter_clinic/screens/profile_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'screens/appointment/appointment_records_screen.dart';
import 'screens/home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final _pageOptions = [
    const HomeScreen(),
    const Appointment(),

    const PanelRecords(),
    const Profile(),

    // const NotificationScreen(),
    // const GroupManagementScreen(),
    // const ProfileScreen(),
  ];
  // final iconList = <IconData>[
  //   Icons.home_outlined,
  //   Icons.data_usage_outlined,
  //   Icons.group_outlined,
  //   Icons.person_outlined,
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  var heart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pageOptions[_selectedIndex]),
      bottomNavigationBar: StylishBottomBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index!;
          });
        },
        items: [
          AnimatedBarItems(
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.house_outlined,
              ),
              title: const Text('Home')),
          AnimatedBarItems(
              selectedColor: Colors.blue,
              icon: const Icon(Icons.calendar_month_outlined),
              title: const Text('Appointment')),
          AnimatedBarItems(
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.receipt_long_outlined,
              ),
              title: const Text('Records')),
          AnimatedBarItems(
              selectedColor: Colors.blue,
              icon: const Icon(
                Icons.person_outline,
              ),
              title: const Text('Profile')),
        ],
        iconSize: 25,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        opacity: 0.2,
        currentIndex: _selectedIndex,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'buttonToPhoneCallBottomNav',
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.location_solid : CupertinoIcons.location,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
