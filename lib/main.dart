import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:service_api_project/controller/provider_class.dart';
import 'package:service_api_project/controller/shared_preferences_controller.dart';
import 'package:service_api_project/screens/add_order_screen.dart';
import 'package:service_api_project/screens/home_screen.dart';
import 'package:service_api_project/screens/login_screen.dart';
import 'package:service_api_project/screens/navbar.dart';
import 'package:service_api_project/screens/onboarding_screen.dart';
import 'package:service_api_project/screens/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ما بتخلي التطبيق يعمل رن غير لما يخلص كل اشي قبله
  await GetStorage.init();
  await SharedPreferencesController().getInitialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderClass(),),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          //initialRoute: "/home",
          routes: {
            '/home': (context) => SharedPreferencesController().getData("login") ?? false ? Navbar() : LoginScreen(),
            "/splash": (context) => SplashScreen(),
            "/login": (context) => LoginScreen(),
            "/onboarding": (context) => OnboardingScreen(),
          }),
    );
  }
}
