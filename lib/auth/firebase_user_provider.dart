import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EviFinanceFirebaseUser {
  EviFinanceFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EviFinanceFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EviFinanceFirebaseUser> eviFinanceFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EviFinanceFirebaseUser>(
            (user) => currentUser = EviFinanceFirebaseUser(user));
