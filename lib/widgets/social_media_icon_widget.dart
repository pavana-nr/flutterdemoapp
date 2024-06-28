import 'package:flutter/material.dart';

class SocialMediaIconsWidget extends StatelessWidget {
  const SocialMediaIconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/google.png', // Replace with your image path
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          'assets/images/linkedin.png', // Replace with your image path
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          'assets/images/facebook.png', // Replace with your image path
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          'assets/images/instagram.png',
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Image.asset(
          'assets/images/whatsapp.png',
          width: 40.0,
          height: 40.0,
        ),
      ],
    );
  }
}
