import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test2/screens/splash_src.dart';

import 'config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: fireBaseAPIKEY ,
      appId: fireBaseAPIID,
      messagingSenderId: fireBaseSenderId,
      projectId: fireBaseProjectId,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(55, 48, 255, 1),
            secondary: Colors.white,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: const SplashSrc(),
      
    );
  }
}
