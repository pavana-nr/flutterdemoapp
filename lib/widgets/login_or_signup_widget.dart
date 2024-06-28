import 'package:flutter/material.dart';

class LoginOrSignupWidget extends StatelessWidget {
  const LoginOrSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Text('Business User?'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Login Here',
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 4, 117, 209)),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Don\'t have an account'),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Sign Up',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 4, 117, 209)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
