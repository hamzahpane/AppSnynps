import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/loading.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:flutter_application_laudnry/widgets/product.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              children: [
                // sisi kiri
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang!",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Mau dibantu apa hari ini?",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(), // mengambil sisa space
                // sisi kanan

                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    Get.to(Loading()); // Navigasi ke layar loading
                    await Future.delayed(const Duration(seconds: 2));
                    Get.toNamed('/notif'); // Navigasi ke layar notifikasi
                  },
                ),
              ],
            ),
          ),

          //Fitur Pertama :
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Stack(
              // widget tumpukan
              children: [
                Image.asset('assets/img-cta.png'),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cucian",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Numpuk?",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 115,
                        height: 33,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Ayo Cuci!",
                            style: greenTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Baris Layanan :

          Container(
            margin: EdgeInsets.only(top: 18, left: 20),
            child: Text(
              "Layanan Kami",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //Fitur 2 Product :
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 18),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // memanggil widget yg sudah dibuat
                  ProductWidget(
                    imgUrl: "assets/img-laundry.png",
                    nama: "Laundry Regular",
                    harga: "IDR 5000 / Kg",
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  ProductWidget(
                    imgUrl: "assets/img-setrika.png",
                    nama: "Laundry Plus Strika",
                    harga: "IDR 8000 / Kg",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ProductWidget(
                    imgUrl: "assets/img-laundry.png",
                    nama: "Laundry Express",
                    harga: "IDR 10000 / Kg",
                  ),
                ],
              ),
            ),
          ),

          //Fitur 3 Product :
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 23),
            child: Stack(
              children: [
                Image.asset('assets/img-drycleaning.png'),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dry Cleaning",
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("IDR 10000 / Kg",
                          style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
