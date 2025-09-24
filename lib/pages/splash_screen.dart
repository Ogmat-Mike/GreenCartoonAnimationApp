import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_cartoon_animation_app/auth/login_or_register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => LoginOrRegister(),
            )
            );
      }
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/gc_logo.png',
                width: 180,
                height: 180,
                // fit: Boxf,
                
                ),
            ),

            const SizedBox(height: 8,),

            Text(
              "Green Cartoon Animations",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}