import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  final int selectedIndex;
  const MyBottomBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  List<String> lbs = ["home", "favorite", "profile"];
  late int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = widget.selectedIndex;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Favorite',
          icon: Icon(
            Icons.favorite,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.person,
          ),
        )
      ],
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
        Navigator.pushReplacementNamed(context, '/${lbs[value]}');
      },
    );
  }
}
