import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/home_screen.dart';
import 'package:my_project/screens/profile_screen.dart';
import 'package:my_project/screens/search_screen.dart';
import 'package:my_project/screens/ticket_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}): super(key:key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}
int _selectedIndex=0;
class _BottomBarState extends State<BottomBar> {
  static final List<Widget>_widgetOptions=<Widget>
  [
   const HomeScreen(),
   const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("My tickets"),
      // ),
      body:Center(
        child: _widgetOptions[_selectedIndex]
        ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color.fromARGB(245, 38, 57, 94),
      items: const [
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
        activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
        label: "Home"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_airplane_regular),
        activeIcon: Icon(FluentSystemIcons.ic_fluent_airplane_filled),
        label: "Search"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_building_regular),
        activeIcon: Icon(FluentSystemIcons.ic_fluent_building_filled),
        label: "Tickets"),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
        activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
        label: "Profile")
      ],
    ),
    );
  }
}