import 'package:cn_app/components/login_button.dart';
import 'package:cn_app/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/google_auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    // loading circle

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // sign up firebase
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
            Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(title: Text("Passwords don't match!"));
            
          },
        );
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('User not found!'),
              );
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Wrong Password!'),
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF111111),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),

                // cn logo
                Image.asset(
                  'assets/gdsc.png',
                  height: 80,
                  scale: 0.8,
                ),
                const SizedBox(
                  height: 20,
                ),

                //sign up text
                const Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),

                const SizedBox(
                  height: 20,
                ),

                //email text field
                MyTextField(
                    controller: emailController,
                    hintText: 'E-mail',
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),

                //password text field
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),

                //confirm password text field
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),

                // signup text
                const Text(
                  'Sign Up with email ID',
                  style: TextStyle(color: Colors.white),
                ),
                //signup button
                const SizedBox(
                  height: 20,
                ),

                LoginButton(
                    onTap: () {
                      signUp();
                    },
                    buttonText: 'Sign Up'),

                const SizedBox(
                  height: 20,
                ),
                //or line
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                // signup with google
                GestureDetector(
                  onTap: () {
                    AuthService().signInWithGoogle();
                  },
                  child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/google.png',
                              height: 50,
                            ),
                            const SizedBox(
                              width: 62,
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),

                // already a member ? Login
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Already a member?',
                      style: TextStyle(color: Colors.white)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      text: ' Login',
                      style: const TextStyle(color: Color(0xFF90C836)))
                ]))
              ],
            ),
          ),
        ),
      ),
      // CN Workspace
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF111111)),
          height: kBottomNavigationBarHeight,
          child: Center(
            child: Image.asset('assets/gdsc.png', height: 30),
          ),
        ),
      ),
    );
  }
}
