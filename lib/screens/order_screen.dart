import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEFFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
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
            title: Text("Item Details"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListView.builder(

          itemCount: 4,
          itemBuilder: (context, index) {
            SizedBox(
              height: 20,
            );
            return Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Order #52001",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(width: 145,),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("28 Nov 2019",style: TextStyle(fontSize: 12,color: Color(0xFF7F8FA6))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 2,bottom: 15),
                        child: Text("Service Type :",style: TextStyle(fontSize: 12,color: Color(0xFF7F8FA6))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Carpenter",style: TextStyle(fontSize: 12,color: Colors.blueAccent)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
