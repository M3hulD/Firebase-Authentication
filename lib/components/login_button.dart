import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

Function()? onTap;
final String buttonText;
  LoginButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 0, 0),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(buttonText,
            style: const TextStyle(color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
            
          ),
        ),
      ),
    );
  }
}