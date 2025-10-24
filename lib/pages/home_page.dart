import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_custom_scrollview.dart';
import 'package:green_cartoon_animation_app/components/my_drawer.dart';
import 'package:green_cartoon_animation_app/pages/animation_page.dart';
import 'package:green_cartoon_animation_app/pages/project_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int _selectedIndex = 0;

    final List<Widget> _children = [
      MyCustomScrollView(),
      AnimationPage(),
      ProjectPage()
    ];

    void _onItemTapped(int index) {
    
    setState(() {
      _selectedIndex = index;
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem> [
    
        // HOME
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
    
        // ANIMATIONS
        BottomNavigationBarItem(
          icon: Icon(Icons.smart_display_outlined),
          label: "Animations",
        ),
    
        // PROJECTS
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline_outlined),
          label: "Projects"),
    
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      onTap: _onItemTapped,
      elevation: 3,
      )
  ,

    );
  }
}

