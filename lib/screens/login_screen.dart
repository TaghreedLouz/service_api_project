import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_api_project/controller/api_controller.dart';
import 'package:service_api_project/controller/shared_preferences_controller.dart';
import 'package:service_api_project/model/api_worker_respons.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/navbar.dart';
import 'package:service_api_project/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController passwordController = TextEditingController();
  late TextEditingController emailController = TextEditingController();

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
        preferredSize: Size.fromHeight(200),
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
                      SystemNavigator.pop();
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: Center(
              child: Image.asset(
                'assets/logo_home3.png',
                width: 150,
                height: 100,
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
                                        Text("Remember me"),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 50),
                                          child: Text("Forgot Password?"),
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
                                        Text("New Member?",style: TextStyle(fontSize: 18)),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "SIGN UP",
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
                                          _performLogin();
                                          SharedPreferencesController controller = SharedPreferencesController();
                                          await controller.getInitialize();
                                          if (isChecked) {if (isChecked)
                                            controller.setData(key: "login", value: isChecked);}

                                        },
                                       //  onPressed: () async {
                                       //    SharedPreferencesController controller = SharedPreferencesController();
                                       //    await controller.getInitialize();
                                       //    if (isChecked) {
                                       //      controller.setData(key: "login", value: isChecked);
                                       //    }
                                       // await _login();
                                       //  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                       //  },
                                        child: Text(
                                          'LOGIN IN',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ],),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar()));

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 120),
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Get Started Now"),
                                              Icon(Icons.arrow_forward_outlined),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )

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
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6 &&
        passwordController.text.length <= 30) {
      return true;
    }
    return false;
  }


  Future<void> _login() async {
    ApiRespons apiRespons = await ApiController().login(email:emailController.text ,password:passwordController.text);
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
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  Navbar()),
            (Route<dynamic> route) => true,
      );
    }
  }
}
