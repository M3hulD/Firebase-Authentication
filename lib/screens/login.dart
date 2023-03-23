import 'package:cn_app/components/login_button.dart';
import 'package:cn_app/screens/signup.dart';
import 'package:cn_app/services/google_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/text_field.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool? isChecked = false;

  // sign in method
Future<void> signIn() async {

    // loading circle

    showDialog(context: context, builder:(context) {
      return const Center(
        child: CircularProgressIndicator(

        ),
      );
    },);  

    // sign in with t&C
    if (isChecked==true) {
      try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text);
      Navigator.pop(context);}
      on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code== 'user-not-found'){
          showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('User not found!'),
        );
      });
        }
        else if (e.code == 'wrong-password'){
          showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('Wrong Password!'),
        );
      });
        }
      }
      }
    else{
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('Accept the Terms and Conditions'),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: const Color(0xFF111111),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
      
                // logo
                Image.asset(
                  'assets/gdsc.png',
                  height: 80,
                  scale: 0.8,
                ),
                const SizedBox(
                  height: 30,
                ),
      
                // username text field
      
                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                ),
      
                const SizedBox(
                  height: 20,
                ),
      
                // password text field
      
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
      
                // T&C check box Forgot Password
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                          value: isChecked,
                          fillColor:
                              MaterialStateProperty.all(Color.fromARGB(255, 0, 96, 25)),
                          checkColor: Colors.white,
                          onChanged: (newbool) {
                            setState(() {
                              isChecked = newbool;
                            });
                          }),
                      const Text(
                        'I accept the Terms & Conditions *',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        onPressed: () {
                          print('Forgot Password');
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(
                  height: 10,
                ),
      
                //Login Button
      
                LoginButton(
                  onTap: signIn,
                  buttonText: 'Login',
                ),
      
                const SizedBox(
                  height: 20,
                ),
      
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
                  height: 15,
                ),
      
                //Google
      
                GestureDetector(
                  onTap: () => AuthService().signInWithGoogle(),
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
                              width: 80,
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
                //Sign Up
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: const Text('Not a member, Sign Up!'),
                      ),
                    ],
                  ),
                ),
      
                // Bottom Navbar CN Workspace
              ],
            ),
          ),
        ),
      ),
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
