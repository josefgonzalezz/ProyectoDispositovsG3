import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class GestordetareasAuthUser {
  GestordetareasAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<GestordetareasAuthUser> gestordetareasAuthUserSubject =
    BehaviorSubject.seeded(GestordetareasAuthUser(loggedIn: false));
Stream<GestordetareasAuthUser> gestordetareasAuthUserStream() =>
    gestordetareasAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
