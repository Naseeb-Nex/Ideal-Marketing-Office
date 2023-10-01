import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/constants/constants.dart';
import 'package:test2/screens/homesrc.dart';
import 'package:test2/screens/loginsrc.dart';

class SplashSrc extends StatefulWidget {
  const SplashSrc({Key? key}) : super(key: key);

  @override
  State<SplashSrc> createState() => _SplashSrcState();
}

class _SplashSrcState extends State<SplashSrc> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () async {
        final prefs = await SharedPreferences.getInstance();
        final loginStatus = prefs.getInt('login');

        if (loginStatus == 1) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const OfficeHome(),
          ));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginSrc(),
          ));
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // Responsive Size
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("assets/icons/imaicon.png"),
              height: s.width * 0.1,
              width: s.width * 0.1,
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: s.width * 0.02,
              height: s.width * 0.02,
              child: const CircularProgressIndicator(
                color: redfg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
