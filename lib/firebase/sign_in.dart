import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/components/my_textfield.dart';
import 'package:notes_app/components/square_tile.dart';
import 'package:notes_app/firebase/note_auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Sign in using AuthService
    try {
      print("Attempting to sign in with email: $email"); // to ensure functionality
      final user = await authService.loginUser(email, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signin successful!')),
        );
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup failed. Please try again.')),
        );
      }
      // Code to confirm if a user has an account or not!
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This account does not exist.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect password.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
       
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),

              //logo
              Icon(Icons.lock, size: 90,),

              const SizedBox(height: 45,),

              // Head text
              Text(
                'S I G N I N!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),

              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                obscureText: false,
                prefixIcon: const Icon(Icons.mail),
                label: Text('Email Address'),
              ),

              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                prefixIcon: const Icon(Icons.mail),
                label: Text('Password'),
                
              ),

              const SizedBox(height: 20),

              // sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.purpleAccent[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //OR
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )
                    ),

                  ],
                ),
                
              ),

              const SizedBox(height: 35),

              // Clickable other option for auth images
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //facebook
                  SquareTile(icon: FontAwesomeIcons.facebookF),
                  SizedBox(width: 15,),

                  //google
                  SquareTile(icon: FontAwesomeIcons.google),
                  SizedBox(width: 15,),

                  //instagram
                  SquareTile(icon: FontAwesomeIcons.instagram),
                ],
              ),
              
              const SizedBox(height: 15),

              // Link below
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )
                      )
                    ]
                  )
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}