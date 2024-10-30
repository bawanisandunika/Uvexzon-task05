import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication.dart'; // Import your AuthenticationService class
import 'index.dart'; // Import your index.dart file

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instance of AuthenticationService
  final AuthenticationService _authService = AuthenticationService();

  // Method to handle email and password login
  Future<void> _login() async {
    final email =
        _emailController.text.trim(); // Trim to remove any extra spaces
    final password = _passwordController.text;

    // Call signIn method and await result
    String? result = await _authService.signIn(
      email: email,
      password: password,
    );

    // Check if result is null (successful login) or an error message
    if (result == null) {
      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );

      // Navigate to the index screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const IndexScreen()), // Update with your IndexScreen class
      );
    } else {
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $result')),
      );
    }
  }

  // Method to handle Google login (You’ll need to implement Google login in AuthenticationService)
  Future<void> _googleLogin() async {
    // Implement Google login logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Google login not implemented')),
    );
  }

  // Method to handle Facebook login (You’ll need to implement Facebook login in AuthenticationService)
  Future<void> _facebookLogin() async {
    // Implement Facebook login logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Facebook login not implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: _login, // Call the _login method
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'or',
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 16),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: _googleLogin, // Call Google login method
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: _facebookLogin, // Call Facebook login method
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                label: Text(
                  'Login with Facebook',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
