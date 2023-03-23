import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cn_app/services/google_auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],),
      body: const Center(
        // child: Text(userName),
        child: Text("Mehul Dadlani \n mehul4college@gmail.com"),
        
      ),
    );
  }

}