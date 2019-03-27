import 'package:flutter/material.dart';

class HomeBottomNavigationBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBottomNavigationBarState();
  }
}

class _HomeBottomNavigationBarState
    extends State<HomeBottomNavigationBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("首页")),
        BottomNavigationBarItem(icon: Icon(Icons.tab), title: Text("体系")),
        BottomNavigationBarItem(
            icon: Icon(Icons.assessment), title: Text("项目")),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind), title: Text("我的")),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
