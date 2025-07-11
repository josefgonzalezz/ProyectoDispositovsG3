import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBhyVxo2Hip55Sy_Oqvuat5wxdQx_6YB_0",
            authDomain: "gestor-tareas-josef.firebaseapp.com",
            projectId: "gestor-tareas-josef",
            storageBucket: "gestor-tareas-josef.firebasestorage.app",
            messagingSenderId: "181963553190",
            appId: "1:181963553190:web:ce8df0bac0c33a29b87767"));
  } else {
    await Firebase.initializeApp();
  }
}
