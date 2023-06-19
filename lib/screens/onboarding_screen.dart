import 'package:flutter/material.dart';
import 'package:service_api_project/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _imagePaths = [
    'assets/onboarding1.png',
    'assets/onboarding2.png',
    'assets/onboarding1.png',
  ];

  void _nextPage() {
    if (_currentPage < _imagePaths.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              physics: NeverScrollableScrollPhysics(), // ما يتحرك الا من خلال الزر
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        _imagePaths[index],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Fast reservation with technicians and craftsmen",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0E9CF9),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 55,
            width: 305,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                _currentPage < _imagePaths.length - 1 ? 'NEXT' : 'GET STARTED',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
