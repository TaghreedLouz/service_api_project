import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
                      ),
                    ),
                  ),
                  Positioned(
                   // child: Icon(Icons.settings, color: Colors.white),
                    child: Image.asset("assets/ic_setting.png"),
                    top: 15,
                    right: 15,
                  ),
                  Positioned.fill(
                    top: 96,
                    child: SizedBox(
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 95),
                                child: Image.asset("assets/edit.png")
                            ),
                            Center(
                              child: Text(
                                "Seraj Al Mutawa",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Center(
                              child: Text(
                                "Riyadh, Saudi Arabia",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/img.png",
                      width: 104,
                      height: 104,
                      fit: BoxFit.contain,
                    ),
                    top: 40,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Language",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text("English",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey)),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      )
                    ]),
                  ),
                  ListTile(
                      title: Text(
                        "My Rates",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      )),
                  ListTile(
                      title: Text(
                        "Contact us",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      )),
                  ListTile(
                      title: Text(
                        "Share App",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      Icons.login_outlined,
                      size: 15,
                      color: Color(0xffAF8344) ,
                    ),
                  ),
                  Text("SIGN OUT",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent)),
                ],
              ),
            ),
            SizedBox(
              height: 55,
            )
          ],
        ),
      ),
    );
  }
}
