import 'package:cn_app/screens/login.dart';
import 'package:cn_app/screens/signup.dart';
import 'package:flutter/src/widgets/framework.dart';


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //show login page initially
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build (BuildContext context) {
    if (showLoginPage==true){
      return Login(
        onTap: togglePages,
      );
    }
    else {
      return SignUp();
    }
  }
}