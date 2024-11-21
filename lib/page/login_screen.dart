import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/component/loading.dart';
import 'package:flutter_application_laudnry/controler/authControler.dart';
import 'package:flutter_application_laudnry/src/mixins/validate.dart';
import 'package:flutter_application_laudnry/themes/style.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  final authC = Get.put(Authcontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/imgLogin.png'),
          SizedBox(height: 37),
          Center(
            child: Text(
              "Laundry Lebih Muda",
              style: primaryTextStyle.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Form Login
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: authC.email,
                    validator: Validation.validateLogin,
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
                          color: Colors.grey, // Warna border saat error
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color:
                              Colors.grey, // Warna border saat error dan fokus
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Form Password
                  TextFormField(
                    obscureText: _obscureText,
                    controller: authC.password,
                    validator: Validation.validatePassword,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
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
                        borderSide: BorderSide(
                          color: Colors.grey, // Warna border saat error
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color:
                              Colors.grey, // Warna border saat error dan fokus
                        ),
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

                  SizedBox(height: 17),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Lupa Password",
                      style: greenTextStyle.copyWith(fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 36),

                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ABF92),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          authC.login(); // Panggil fungsi login
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Masuk",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(width: 2),
                      InkWell(
                        onTap: () async {
                          //Menampilkan Loading
                          Get.to(const Loading());
                          await Future.delayed(const Duration(seconds: 2));
                          // Navigasi menggunakan GetX ke '/register'
                          Get.toNamed('/register');
                        },
                        child: Text(
                          "Daftar",
                          style: greenTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
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
