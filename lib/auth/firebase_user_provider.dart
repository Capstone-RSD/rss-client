import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Rsd1FirebaseUser {
  Rsd1FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Rsd1FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Rsd1FirebaseUser> rsd1FirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Rsd1FirebaseUser>(
      (user) {
        currentUser = Rsd1FirebaseUser(user);
        return currentUser!;
      },
    );
