import 'package:flutter/material.dart';
import 'package:service_api_project/screens/home_screen.dart';

class DoneOrderScreen extends StatefulWidget {

  @override
  State<DoneOrderScreen> createState() => _DoneOrderScreenState();
}

class _DoneOrderScreenState extends State<DoneOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: Colors.black),
          ),
        ),

        body: Column(
        children: [
          SizedBox(height: 10),
          Image.asset("assets/done.png"),
          SizedBox(height: 30),
          Image.asset("assets/done_text.png"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Center(child: Text("The ORDER has been sent. A technician will contact you")),
          ),
          SizedBox(height: 60),
          Container(
            height: 55,
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              child: Text('GO TO HOME'),
            ),
          ),
        ],
      )

    );
  }
}
