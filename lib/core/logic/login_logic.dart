import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_auth/screens/auth/register_screen.dart';
import 'package:simple_auth/screens/home/home_screen.dart';

void login(BuildContext context,
    {required String email, required String password}) async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Logged In Successfully"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.code.toString()),
        ),
      );
    }
  }
}
