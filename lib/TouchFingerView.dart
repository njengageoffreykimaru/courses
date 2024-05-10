import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AdminRegister.dart';
import 'Login_screen.dart';
import 'SignUpScreen.dart';
import 'constants.dart';
import 'custom_flat_button.dart';



class TouchFingerView extends StatefulWidget {
  const TouchFingerView({super.key});

  @override
  State<TouchFingerView> createState() => _TouchFingerViewState();
}

class _TouchFingerViewState extends State<TouchFingerView> {
  bool? _hasBioSensor;





  void _navigateToManualLogin() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: ((context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
           const Text(
              "Course Application",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            const SizedBox(height: 40),
            Text(
              'Quick login with Touch ID',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.fingerprint, size: 90, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              'Touch ID',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            const Spacer(),
            CustomFlatButton(
                text: 'Login',
                color: MyColors.kPrimaryColor,
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>LoginScreen()));
                }),
            const SizedBox(height: 20),
            CustomFlatButton(
                text: 'Register',
                color: Colors.white,
                textColor: MyColors.kPrimaryColor,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                }),
            const SizedBox(height: 30),
            CustomFlatButton(
                text: 'AdminRegister',
                color: MyColors.kPrimaryColor,
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>AdminSignUpScreen()));
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
