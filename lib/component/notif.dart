import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/loading.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:get/get.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifikasi",
          style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Get.to(Loading());
            await Future.delayed(const Duration(seconds: 2));
            Get.toNamed('/home');
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              "Tandai Terbaca",
              style: greenTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 16, left: 20, right: 20),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hore!! Pesananmu sedang diproses",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Cek pesananmu sekarang!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/img-sukses.png',
                    width: 21,
                    height: 21,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 23, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: blackColor,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cucianmu telah selesai!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Kamu bisa cek kelengkapan cucianmu!",
                        style: primaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
