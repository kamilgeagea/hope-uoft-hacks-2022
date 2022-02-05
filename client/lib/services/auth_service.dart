import 'package:client/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(userName: '', profileImageUrl: '', email: '')
        : null;
  }

  Stream<UserModel?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signIn(String email, String password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
          email: email, password: password)) as User;

      _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUp(String username, String email, String password) async {
    //String emailTwo = email;
    //SINCE WE SIGN IN WITH USERNAME IN ORDER TO WORK WITH FIREBASE AUTH
    //WE HAVE TO APPEND A FAKE DOMAIN TO THE USERNAME TO CREATE A 'EMAIL' BECAUSE
    //FIREBASE AUTH HATES USERNAMES
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: username + "@hope.com", password: password);
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("users/" + username);

      await ref.set({
        'username': username,
        'email': email,
        'profileImageUrl': '',
      });

      _userFromFirebaseUser(user.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
