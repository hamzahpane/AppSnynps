import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/config/cofing.dart';
import 'package:flutter_application_laudnry/page/splash_screen.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:flutter_application_laudnry/component/loading.dart'; // Import loading screen

class Authcontroler {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController telepon = TextEditingController();

  Future login() async {
    var url = Uri.parse(Cofing().urlLogin);

    try {
      final response = await http
          .post(url, body: {"email": email.text, "password": password.text});

      var responseDecode = jsonDecode(response.body);
      print(responseDecode);

      if (response.statusCode == 200) {
        // Save user data using SpUtil
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("name", responseDecode["data"]["name"]);
        SpUtil.putString("email", responseDecode["data"]["email"]);
        SpUtil.putString("telepon", responseDecode["data"]["telepon"]);

        Get.snackbar(
          "Login Berhasil",
          "Login Berhasil ",
          backgroundColor: whiteColor,
          colorText: blackColor,
        );

        // Now show loading screen
        Get.to(() => const Loading());
        // Wait for 2 seconds before navigating to home screen
        await Future.delayed(const Duration(seconds: 2));

        // Navigate to the home screen
        Get.offNamed('/home'); // Navigate to home page after a short delay
      } else {
        // If login fails, close loading screen and show error snackbar

        Get.snackbar(
          "Error",
          "Username / Pass Salah, silahkan coba lagi",
          backgroundColor: whiteColor,
          colorText: blackColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: whiteColor,
        colorText: blackColor,
      );
    }
  }

  Future register() async {
    var url = Uri.parse(Cofing().urlRegister);

    try {
      // Show success snackbar first

      final response = await http.post(url, body: {
        "email": email.text,
        "password": password.text,
        "name": name.text,
        "telepon": telepon.text
      });

      var responseDecode = jsonDecode(response.body);
      print(responseDecode);

      Map<String, dynamic> errorValidation = responseDecode["data"];

      if (response.statusCode == 200) {
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("name", responseDecode["data"]["name"]);
        SpUtil.putString("email", responseDecode["data"]["email"]);
        SpUtil.putString("telepon", responseDecode["data"]["telepon"]);

        // Wait for 2 seconds before navigating to home screen
        Get.snackbar(
          "Register Berhasil",
          "Register Berhasil ",
          backgroundColor: whiteColor,
          colorText: blackColor,
        );

        // Now show loading screen
        Get.to(() => const Loading());
        await Future.delayed(const Duration(seconds: 2));

        // Navigate to the home screen
        Get.offNamed('/home'); // Navigate to home
      } else {
        // Show error snackbar if validation fails
        Get.snackbar(
          "Error",
          responseDecode["message"] == "error Validation"
              ? errorValidation.toString()
              : responseDecode["message"],
          backgroundColor: whiteColor,
          colorText: blackColor,
          showProgressIndicator: true,
        );
      }
    } catch (e) {
      // If an exception occurs, close loading screen and show error snackbar
      Get.back(); // Close loading screen
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: whiteColor,
        colorText: blackColor,
        showProgressIndicator: true,
      );
    }
  }

  Future logout() async {
    final url = Uri.parse(Cofing().urlLogout);
    try {
      final Response = await http.get(url);

      var responseDecode = jsonDecode(Response.body);
      print(responseDecode);

      if (Response.statusCode == 200) {
        // hapus data user yg tersimpan di local storage device menggunakan package SpUtil
        SpUtil.remove("id_user");
        SpUtil.remove("name");
        SpUtil.remove("email");
        SpUtil.remove("telepon");
        Get.snackbar(
          "Logout",
          " Berhasil Keluar",
          backgroundColor: whiteColor,
          colorText: blackColor,
        );
        Get.to(() => const Loading());

        await Future.delayed(const Duration(seconds: 2));

        // arahkan ke halaman SplashPage
        Get.offAll(SplashScreen());
      } else {
        Get.snackbar(
          "Error",
          responseDecode["message"],
          backgroundColor: whiteColor,
          colorText: blackColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: whiteColor,
        colorText: blackColor,
      );
    }
  }
}
