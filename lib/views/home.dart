import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/auth_service.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
 final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text('logged in'),
            GestureDetector(
              onTap: () => AuthService().signout(),
              child: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

}