import 'package:flutter/material.dart';
import 'package:service_api_project/controller/custom_appbar_clipper.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/navbar.dart';

class MoreScreen extends StatefulWidget {

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("More"),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
          child: Column(children: [
            ListTile(
                title: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "FAQ's",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "About App",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "Rate App",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            ListTile(
                title: Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 13,
                )),
            SizedBox(
              height: 195,
            )
          ])),
    );
  }
}
