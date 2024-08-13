import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_crud9/auth/intro_screen.dart';
import 'firebase_options.dart';

void main() async {
  await setup();

  runApp(MyApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('connected to :${app.options.projectId}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
