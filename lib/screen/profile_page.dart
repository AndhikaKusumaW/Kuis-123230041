import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            children: [
              Text(
                "Welcome, $username!",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,                  
                ),
              ),
          
              SizedBox(height: 5), 
          
              Text(
                "Andhika Kusuma Wardana",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
          
              SizedBox(height: 5), 
          
              Text(
                "123230041",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
          
              SizedBox(height: 5), 
          
              Text(
                "Hobi: Olahraga",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}