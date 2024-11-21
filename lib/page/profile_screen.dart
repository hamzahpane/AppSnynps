import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/popup.dart';
import 'package:flutter_application_laudnry/controler/authControler.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:sp_util/sp_util.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final authC = Get.put(Authcontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print("Edit Profil");
                },
                child: Text(
                  "Edit Profil",
                  style: greenTextStyle,
                ),
              ),
            ),
            SizedBox(height: 41),
            Text(
              "Username",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            Text(
              SpUtil.getString("name").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "Email",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            Text(
              SpUtil.getString("email").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "Nomer Telepon",
              style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 14),
            Text(
              SpUtil.getString("telepon").toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 39),
            GestureDetector(
              onTap: () {
                print("editPassword");
              },
              child: Row(
                children: [
                  Text(
                    "Reset Password",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 24),
                ],
              ),
            ),
            SizedBox(height: 39),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutPopup(
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onConfirm: () {
                        authC.logout();
                      },
                    );
                  },
                );
              },
              child: Text(
                "Logout",
                style: redTextStyle.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
