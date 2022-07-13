import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EviFirebaseUser {
  EviFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EviFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EviFirebaseUser> eviFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<EviFirebaseUser>((user) => currentUser = EviFirebaseUser(user));
