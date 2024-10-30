import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image with edit icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://your-image-url.jpg'), // Replace with user's image
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    // Add functionality to edit image
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            // Name with edit icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Martha Hays',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    // Add functionality to edit name
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Task Information
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('10 Tasks left'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('5 Tasks done'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Divider(color: Colors.white54),
            // Settings
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title:
                  Text('App Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                // App settings functionality
              },
            ),
            // Account Settings
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white),
              title: Text('Change account name',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Change account name functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.white),
              title: Text('Change account password',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Change account password functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: Colors.white),
              title: Text('Change account image',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Change account image functionality
              },
            ),
            Divider(color: Colors.white54),
            // Uploid Options
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About Us', style: TextStyle(color: Colors.white)),
              onTap: () {
                // About Us functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.white),
              title: Text('FAQ', style: TextStyle(color: Colors.white)),
              onTap: () {
                // FAQ functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.support, color: Colors.white),
              title: Text('Help & Feedback',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Help & Feedback functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.white),
              title: Text('Support Us', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Support Us functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Logout functionality
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
