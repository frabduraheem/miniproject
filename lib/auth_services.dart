import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Get the currently logged-in user
  User? get currentUser => firebaseAuth.currentUser;

  // Listen to authentication state changes
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Sign in user
  Future<UserCredential> signUserIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign up user
  Future<UserCredential> signUpUser({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send email verification after signing up
    await userCredential.user?.sendEmailVerification();

    return userCredential;
  }

  // Resend verification email
  Future<void> resendVerificationEmail() async {
    if (currentUser != null && !currentUser!.emailVerified) {
      await currentUser!.sendEmailVerification();
    }
  }

  // Sign out user
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}

// ✅ Global instance of AuthServices
final AuthServices authService = AuthServices();
