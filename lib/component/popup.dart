import 'package:flutter/material.dart';
import 'package:flutter_application_laudnry/themes/style.dart';

class LogoutPopup extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const LogoutPopup({
    Key? key,
    required this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Yakin ingin keluar akun?',
        style: primaryTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24, left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF4ABF92),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: onCancel,
                child: Text(
                  "Batalkan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onConfirm,
          child: Center(
            child: Text(
              "Yakin, keluar",
              style: redTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
