import 'package:flutter/material.dart';
import './addTask.dart';
import './viewTask.dart';
import './profile.dart'; // Import the ProfilePage

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            // Add functionality for the menu button if needed
          },
        ),
        title: const Text(
          'Index',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewTaskScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/index.png'),
              radius: 20,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'lib/assets/index.png',
              height: 200,
            ),
            const SizedBox(height: 30),
            const Text(
              'What do you want to do today?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tap + to add your tasks',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined, color: Colors.white),
                    onPressed: () {
                      // Add navigation to Home screen if needed
                    },
                  ),
                  const Text(
                    'Index',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.calendar_today_outlined,
                        color: Colors.white),
                    onPressed: () {
                      // Add navigation to Calendar screen if needed
                    },
                  ),
                  const Text(
                    'Calendar',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(width: 40), // Space for the floating action button
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.timer_outlined, color: Colors.white),
                    onPressed: () {
                      // Add navigation to Focus screen if needed
                    },
                  ),
                  const Text(
                    'Focus',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person_outline, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(), // Navigate to ProfilePage
                        ),
                      );
                    },
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddTaskScreen(email: 'user@example.com'),
            ),
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
