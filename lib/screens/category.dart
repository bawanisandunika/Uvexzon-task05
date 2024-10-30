import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose Category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent scrolling
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildCategoryItem(
                      'Grocery', 'lib/assets/bread.png', Colors.greenAccent),
                  _buildCategoryItem(
                      'Work', 'lib/assets/briefcase.png', Colors.redAccent),
                  _buildCategoryItem(
                      'Sport', 'lib/assets/sport.jpg', Colors.cyanAccent),
                  _buildCategoryItem(
                      'Design', 'lib/assets/design.png', Colors.tealAccent),
                  _buildCategoryItem('University', 'lib/assets/mortarboard.png',
                      Colors.purpleAccent),
                  _buildCategoryItem(
                      'Social', 'lib/assets/megaphone.png', Colors.pinkAccent),
                  _buildCategoryItem(
                      'Music', 'lib/assets/music.png', Colors.pink),
                  _buildCategoryItem(
                      'Health', 'lib/assets/heartbeat.png', Colors.green),
                  _buildCategoryItem('Movie', 'lib/assets/video-camera.png',
                      Colors.blueAccent),
                  _buildCategoryItem(
                      'Home', 'lib/assets/home.png', Colors.orangeAccent),
                  _buildCategoryItem(
                      'Create New', 'lib/assets/add.png', Colors.lightGreen),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for adding a new category
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
