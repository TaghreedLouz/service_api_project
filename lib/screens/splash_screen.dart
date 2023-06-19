import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:service_api_project/controller/shared_preferences_controller.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/login_screen.dart';
import 'package:service_api_project/screens/navbar.dart';
import 'package:service_api_project/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization tasks here if needed
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    final isFirstTime = GetStorage().read<bool>('isFirstTime') ?? true;
    if (isFirstTime) {
      // If it's the first time, navigate to the onboarding screen
      GetStorage().write('isFirstTime', false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      // Otherwise, navigate to the home screen
     // Navigator.pushReplacementNamed(context, '/home');

      if(GetStorage().read("token") != null){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
          ),

        ],
      ),
    );
  }
}
