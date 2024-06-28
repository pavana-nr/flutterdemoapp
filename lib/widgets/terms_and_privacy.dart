import 'package:flutter/material.dart';

class TermsAndPrivacyWIdget extends StatelessWidget {
  const TermsAndPrivacyWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
                text:
                    'By continuing,you agree to \n Promilo\'s'), // Regular text
            TextSpan(
              text: ' Terms of Use & Privacy Policy',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15.0), // Bold text
            ),
          ],
        ),
      ),
    );
  }
}
