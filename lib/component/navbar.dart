import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/page/home_screen.dart';
import 'package:flutter_application_laudnry/page/pemesanan_screen.dart';
import 'package:flutter_application_laudnry/page/profile_screen.dart';
import 'package:flutter_application_laudnry/themes/style.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int seleceted = 0;

  static List<Widget> screenList = [
    HomeScreen(),
    PemesananScreen(),
    ProfileScreen()
  ];

  void OnItemTapped(int index) {
    setState(() {
      seleceted = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // index 0
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),

          // index 1
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Pesanan"),

          // index 2
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],

        // atribut konfigurasi bottomnavigationbarnya
        currentIndex: seleceted, // index yg terpilih
        selectedItemColor: primaryColor, // warna saat item terpilih
        unselectedItemColor: greyColor, // warna saat item tidak terpilih
        onTap: OnItemTapped, // saat item ditap
        backgroundColor: whiteColor, // warna background
        type: BottomNavigationBarType.fixed, // tipe bottomnavigationbar
      ),
      body: screenList.elementAt(seleceted),
    );
  }
}
