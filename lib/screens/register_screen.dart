import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_api_project/controller/api_controller.dart';
import 'package:service_api_project/model/api_worker_respons.dart';
import 'package:service_api_project/model/worker.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late String selectedServiceType;
  bool isChecked = false;
  bool isPasswordVisible = false;
  List<String> serviceTypesList = [
    "Carpenter",
    "Electrical",
    "Carpentry",
    "Painting",
    "Gardening",
    "Cleaning"
  ];

  @override
  void initState() {
    super.initState();
    selectedServiceType = serviceTypesList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF346EDF), Color(0xFF6CC3F9)],
          ),
        ),
        child: DefaultTabController(
          length: 2,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                children: [
                  TabBar(
                    labelColor:   Color(0xFF346EDF),
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        text: 'Service provider',
                      ),
                      Tab(
                        text: 'Customer',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('Service provider its update')),
                        SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      controller: nameController,
                                      onSubmitted: (value) {
                                        nameController = value as TextEditingController;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          borderSide: BorderSide(color: Colors.blue),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          borderSide: BorderSide(color:  Color(0xFF346EDF)),
                                        ),
                                        hintText: 'Full Name',
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      controller: emailController,
                                      onSubmitted: (value) {
                                        emailController = value as TextEditingController;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.blue),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color:  Color(0xFF346EDF)),
                                        ),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(17),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/flag.png',
                                                  height: 25,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("+966"),
                                                Icon(Icons.keyboard_arrow_down_outlined)
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: TextField(
                                              controller: phoneController,
                                              onSubmitted: (value) {
                                                phoneController = value as TextEditingController;
                                              },
                                              keyboardType: TextInputType.phone,
                                              style: TextStyle(color: Color(0xFFAF8344)),
                                              cursorColor: Color(0xFFAF8344),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Phone Number',
                                                hintStyle: TextStyle(color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      onSubmitted: (value) {
                                        passwordController = value as TextEditingController;
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                      obscureText: !isPasswordVisible,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.blue),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.indigoAccent),
                                        ),
                                        hintText: 'Password',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        filled: true,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isPasswordVisible = !isPasswordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: DropdownButton<String>(
                                          value: selectedServiceType,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedServiceType = newValue!;
                                            });
                                          },
                                          items: serviceTypesList.map((value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          underline: Container(), // Remove the default underline
                                          icon: Icon(Icons.keyboard_arrow_down_outlined), // Add the dropdown icon
                                          iconSize: 30, // Adjust the icon size as needed
                                          isExpanded: true, // Expand the dropdown to fill the available space
                                          hint: Text('Select a service type'), // Add a hint text
                                          style: TextStyle(color: Colors.black), // Customize the dropdown text style
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                          shape: CircleBorder(),
                                          fillColor: MaterialStateProperty.all( Color(0xFF346EDF)),
                                          checkColor: Colors.white,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: 'I Read and Accept ',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Home Service Terms & Conditions',
                                                style: TextStyle(
                                                    color:  Color(0xFF346EDF), fontSize: 12
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Have Account?",style: TextStyle(fontSize: 18)),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text(
                                                "SIGN IN",
                                                style: TextStyle(
                                                    color:  Color(0xFF346EDF),
                                                    decoration: TextDecoration.underline, fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          )

                                        ],),
                                      Container(
                                        height: 60,
                                        width: 140,
                                        margin: EdgeInsets.only(left: 90,),
                                        child: Material(
                                          elevation: 5,
                                          borderRadius: BorderRadius.circular(5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF346EDF),
                                                  Color(0xFF6CC3F9),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: MaterialButton(
                                              onPressed: () async {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                                await _performRegister();
                                              },
                                              child: Text(
                                                'SIGN UP',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],)


                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),);
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    }

    // showSnackBar(context:context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    ApiRespons apiRespons = await  ApiController().register(workers: workers);
    print(apiRespons.message);
    Fluttertoast.showToast(
      msg: apiRespons.message!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    if(apiRespons.success!){
      // if i want it to go directily     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
  worker get workers {
    worker workers = worker();
    workers.name = nameController.text;
    workers.email = emailController.text;
    workers.phone = phoneController.text;
    workers.password = passwordController.text;
    return workers;
  }
}
