import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_button.dart';
import 'package:green_cartoon_animation_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),

              const SizedBox(height: 25,),

              // email

              MyTextfield(
                controller: emailController, 
                hintText: 'Enter e-mail', 
                obscureText: false
                ),

                const SizedBox(height: 10,),

              // password
              MyTextfield(
                controller: passwordController, 
                hintText: 'Enter password', 
                obscureText: true
                ),

                const SizedBox(height: 10,),

              // confirm password
              MyTextfield(
                controller: confirmPasswordController, 
                hintText: 'Confirm password', 
                obscureText: true
                ),

                const SizedBox(height: 25,),

                // sign in button

                MyButton(
                  text: 'Sign Up', 
                  onTap: () {}
                  ),

                  const SizedBox(height: 25,),

                // already have an account? Login here.

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  ),

                const SizedBox(width: 4,),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Log in now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                
              ],
              )
          ],
        ),
      ),
    );
  }
}