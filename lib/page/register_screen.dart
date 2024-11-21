import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/loading.dart';
import 'package:flutter_application_laudnry/controler/authControler.dart';
import 'package:flutter_application_laudnry/src/mixins/validate.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  final authC = Get.put(Authcontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Persiapkan Akunmu",
          style: primaryTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Get.to(Loading());
            await Future.delayed(const Duration(seconds: 2));
            Get.toNamed('/login');
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Form Username
                  TextFormField(
                    validator: Validation.validateUsername,
                    controller: authC.name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Masukkan Username",
                      hintStyle: secondaryTextStyle,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),

                  //Form Phone Number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: authC.telepon,
                    validator: Validation.validateTelpone,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nomor Telepon",
                      hintStyle: secondaryTextStyle,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),

                  //Form Email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: authC.email,
                    validator: Validation.validateLogin,
                    decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      hintStyle: secondaryTextStyle,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),

                  //Form Password
                  TextFormField(
                    obscureText: _obscureText,
                    validator: Validation.validatePassword,
                    controller: authC.password,
                    decoration: InputDecoration(
                      hintText: "Masukan Password",
                      hintStyle: secondaryTextStyle,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: greyColor),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: greyColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),

                  // Submit Button
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF4ABF92),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          authC.register();
                        }
                      },
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun?",
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        onTap: () {
                          print("Login");
                        },
                        child: Text(
                          "Login",
                          style: greenTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
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
