import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/themes/style.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animasi loading
            CircularProgressIndicator(
              color: const Color(0xFF4ABF92), // Sesuaikan dengan tema Anda
              strokeWidth: 6.0,
            ),
            const SizedBox(height: 20),
            // Teks di bawah animasi
            Text(
              'Loading...',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
