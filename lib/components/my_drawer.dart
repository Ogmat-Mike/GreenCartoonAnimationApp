import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_drawer_tile.dart';
import 'package:green_cartoon_animation_app/pages/about_us_page.dart';
import 'package:green_cartoon_animation_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  const MyDrawer({
    super.key,
    required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // backgroundColor: Color(0xff079b50),
      child: Center(
        child: Column(
          children: [
            // app logo
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/gc_logo.png',
                width: 60,
                height: 60,
                // fit: Box,
                
                ),
            ),
            ),
            const SizedBox(height: 4,),

            Text(
              "GREEN CARTOONS",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
               ),
              ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
        
            // home list tile
            MyDrawerTile(
              text: "H O M E" , 
              icon: Icons.home, 
              onTap: () {
                Navigator.pop(context);
                onItemSelected(0);
              } 
            ),

            const SizedBox(height: 10,),

            // Animations list tile
            MyDrawerTile(
              text: "A N I M A T I O N S", 
              icon: Icons.smart_display_outlined, 
              onTap: () { 
                Navigator.pop(context);
                onItemSelected(1);
              }

            ),

            const SizedBox(height: 10,),

            // Projects list tile
            MyDrawerTile(
              text: "P R O J E C T S", 
              icon: Icons.work_outline_outlined, 
              onTap: () { 
                Navigator.pop(context);
                onItemSelected(2);
              }
            ),

            const SizedBox(height: 10,),
        
            // settings list tile
            MyDrawerTile(
              text: "S E T T I N G S", 
              icon: Icons.settings, 
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()
                ));
              }
              ),

              const Spacer(),        
        
            // logout
            MyDrawerTile(
              text: "About Us", 
              icon: Icons.logout, 
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()
                ));
              }
            ),

            const SizedBox(height: 25,),
        
          ],
        ),
      ),
    );
  }
}