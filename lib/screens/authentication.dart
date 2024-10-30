import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'username': username,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore
              .collection('users')
              .doc(userCredential.user?.uid)
              .set({
            'username': googleUser?.displayName,
            'email': googleUser?.email,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        return null;
      }
      return 'Sign in failed.';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Add a task to the 'tasks' collection under the user's email
  Future<String?> addTask(
      {required String taskDescription, required String priority}) async {
    try {
      // Get current user's email
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // Save task with the user's email
        await _firestore.collection('tasks').add({
          'email': user.email, // Ensure the email is correctly assigned
          'taskDescription': taskDescription,
          'priority': priority, // Include priority
          'createdAt': FieldValue.serverTimestamp(),
        });
        return null;
      } else {
        return 'No user is currently signed in';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
