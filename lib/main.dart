import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/loginsrc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyAc9PeF1-peDO__k2aGsxqymYsZH9w-UoE",
      appId: "1:670832400441:web:cfc155db34d416b70d15e8",
      messagingSenderId: "670832400441",
      projectId: "ima-app-2d6dd",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSrc(),
    );
  }
}
