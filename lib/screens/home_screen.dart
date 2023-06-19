import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_api_project/controller/custom_appbar_clipper.dart';
import 'package:service_api_project/controller/data_repo.dart';
import 'package:service_api_project/model/service.dart';
import 'package:service_api_project/screens/add_order_screen.dart';
import 'package:service_api_project/screens/navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Service>> _fetchServices() {
    return DataRepo().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280),

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
              leading: SizedBox(),
              title: Image.asset(
                'assets/logo_home3.png',
                width: 60,
                height: 40,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
              flexibleSpace: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 300,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: PageView(
                      children: [
                        Image.network(
                          "https://cdn.xxl.thumbs.canstockphoto.com/hardware-store-workers-in-timber-department-hardware-store-workers-working-in-timber-department-picture_csp20497110.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          "https://st2.depositphotos.com/1017986/6681/i/950/depositphotos_66814217-stock-photo-man-drilling-hole-in-wall.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          "https://media.istockphoto.com/id/1132791347/photo/multi-ethnic-team-of-blue-collar-air-conditioner-repairmen-at-work.jpg?s=612x612&w=0&k=20&c=14DdPrqIla4zE7Jp8CYMYbVdsXBtOssOOxczMObLiCE=",
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select Service",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF346EDF),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Service>>(
              future: _fetchServices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data!.isNotEmpty) {
                  return GridView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.1,
                    ),
                    itemBuilder: (context, index) {
                      if (index < snapshot.data!.length) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddOrderScreen(
                                  snapshot.data![index].id!,
                                ),
                              ),
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.pink.shade200,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.network(
                                      snapshot.data![index].icon!,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    snapshot.data![index].name!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF346EDF),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text("No data available"),
                        );
                      }
                    },
                  );
                } else {
                  return Center(
                    child: Text("No data available"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}