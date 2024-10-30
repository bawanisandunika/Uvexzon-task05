// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import Device Preview
// Import the ManageScreen file
import './screens/combineScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import for Firestore

void main() async {
  // Ensure that widget binding is initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBogqrrSlFHoygiowsZjEjo9Rc8_z9h0dk",
      authDomain: "signup-f8325.firebaseapp.com",
      projectId: "signup-f8325",
      storageBucket: "signup-f8325.appspot.com",
      messagingSenderId: "715948989339",
      appId: "1:715948989339:web:e923be791c3bbf583fdf3e",
    ),
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable Device Preview in debug mode
      builder: (context) => const MyApp(), // Wrap MyApp with DevicePreview
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      theme: ThemeData.dark(), // Dark theme for the app
      home: const StartScreen(), // StartScreen as the home screen
      builder: DevicePreview.appBuilder, // Use Device Preview's app builder
    );
  }
}

// StartScreen widget
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the logo
            Image.asset(
              'lib/assets/logo.png', // Path to your logo image
              height: 200, // Adjust height as needed
              width: 200, // Adjust width as needed
            ),
            const SizedBox(height: 20), // Space between logo and button
          ],
        ),
      ),
      // Align widget to position the button
      floatingActionButton: Align(
        alignment: Alignment.bottomRight, // Align to bottom right
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding to the button
          child: ElevatedButton(
            onPressed: () {
              // Navigate to ManageScreen when pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CombineScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.black.withOpacity(0.5), // Black with transparency
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded button
              ),
            ),
            child: const Text(
              'NEXT',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // White color for NEXT button text
              ),
            ),
          ),
        ),
      ),
    );
  }
}
