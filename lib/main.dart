import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/navbar.dart';
import 'package:flutter_application_laudnry/component/notif.dart';
import 'package:flutter_application_laudnry/page/login_screen.dart';
import 'package:flutter_application_laudnry/page/register_screen.dart';
import 'package:flutter_application_laudnry/page/splash_screen.dart';
import 'package:sp_util/sp_util.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => Navbar()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/notif', page: () => NotifikasiPage())
      ],
    );
  }
}
