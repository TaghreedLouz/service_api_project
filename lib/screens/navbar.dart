import 'package:flutter/material.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/more_screen.dart';
import 'package:service_api_project/screens/order_screen.dart';
import 'package:service_api_project/screens/user_screen.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    UserScreen(),
    MoreScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedIconTheme: IconThemeData(size: 40),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                AssetImage("assets/logo_home3.png"),
                size: 20,
              ),
            ),
            label: "Service",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/order.png"),
              size: 20,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/user.png"),
              size: 20,
            ),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/more.png"),
              size: 20,
            ),
            label: "More",
          ),
        ],
      ),
    );
  }
}
