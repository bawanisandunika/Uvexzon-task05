import 'package:flutter/material.dart';
import 'intro_screen.dart'; // Importing IntroScreen

class CombineScreen extends StatefulWidget {
  const CombineScreen({Key? key}) : super(key: key);

  @override
  _CombineScreenState createState() => _CombineScreenState();
}

class _CombineScreenState extends State<CombineScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> screens = [
    {
      'title': 'Manage your tasks',
      'subtitle':
          'You can easily manage all of your daily\ntasks in DoMe for free',
      'imagePath': 'lib/assets/manage_image.png',
    },
    {
      'title': 'Create daily routine',
      'subtitle':
          'In Uptodo you can create your\npersonalized routine to stay productive',
      'imagePath': 'lib/assets/daily_image.png',
    },
    {
      'title': 'Organize your tasks',
      'subtitle':
          'You can organize your daily tasks by\nadding your tasks into separate categories',
      'imagePath': 'lib/assets/organize_image.png',
    },
  ];

  void navigateNext() {
    if (currentIndex < screens.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Navigate to the IntroScreen when reaching the last screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    }
  }

  void navigateBack() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    } else {
      Navigator.pop(context); // Navigate back if it's the first screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenData = screens[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Top row with 'SKIP' button
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                    onPressed: () {
                      // Skip functionality (optional)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen()),
                      );
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Center image
              Image.asset(
                screenData['imagePath'],
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 40),

              // Title text
              Text(
                screenData['title'],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Subtitle text
              Text(
                screenData['subtitle'],
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Back and Next buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: navigateBack,
                      child: const Text(
                        'BACK',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: navigateNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6166DC),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
