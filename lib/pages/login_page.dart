import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_button.dart';
import 'package:green_cartoon_animation_app/components/my_textfield.dart';
import 'package:green_cartoon_animation_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers.
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // login method

    void login() {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
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

            const SizedBox(height: 25,),

            // message, app slogan
            Text(
              "Green Cartoon Animations",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            
            const SizedBox(height: 25,),
            
            // email textfield
            MyTextfield(
              controller: emailController, 
              hintText: 'enter your e-mail', 
              obscureText: false,
            ),

            const SizedBox(height: 10,),
            
            // password textfield
            MyTextfield(
              controller: passwordController, 
              hintText: "Enter your password", 
              obscureText: true,
            ),

            const SizedBox(height: 10,),
            // sign in button

            MyButton(
              text: "Log In", 
              onTap: login
            ),

            const SizedBox(height: 25,),

            // not a member? register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                
                const SizedBox(width: 4,),
            
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ],

         
        ),
      ),
    );
  }
}