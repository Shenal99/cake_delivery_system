import 'dart:convert';

import 'package:cake_delivery_system/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  final User? user;
  const Home(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome, ${user!.email}'),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await FirebaseAuth.instance.signOut();
                navigator.pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Logout"))
        ],
      )),
    );
  }
}
