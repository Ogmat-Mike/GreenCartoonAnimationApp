import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_appbar_actions.dart';
import 'package:green_cartoon_animation_app/components/my_custom_scrollview.dart';
import 'package:green_cartoon_animation_app/components/my_drawer.dart';
import 'package:green_cartoon_animation_app/pages/animation_page.dart';
import 'package:green_cartoon_animation_app/pages/project_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int _selectedIndex = 0;

    final List<Widget> _pages = [
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: MyAppBarActions(
          iconImage: Image.asset(
            "assets/gc_logo.png",
            height: 46,
            width: 46,          
          ),
      
          title: Text(
            "Green Cartoon", 
            style: TextStyle(
              color: Color(0xff079b50),
              fontFamily: "Quicksand-SemiBold",
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
            ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages
        ),
        drawer: MyDrawer(
          onItemSelected: _onItemTapped,
        ),
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
      
      ),
    );
  }
}

