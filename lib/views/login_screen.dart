import 'package:assignment1/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../widgets/divider_widget.dart';
import '../widgets/login_or_signup_widget.dart';
import '../widgets/social_media_icon_widget.dart';
import '../widgets/terms_and_privacy.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = 'test45@yopmail.com';
  String _password = 'Test@123';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Center(
                    child: Text(
                  "company",
                  style: TextStyle(fontSize: 25.0),
                )),
                const SizedBox(height: 60),
                const Text(
                  'Hi, Welcome Back!',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Please Sign in to continue",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            )),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign In With OTP',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromARGB(255, 4, 117, 209)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                            )),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value!,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (newValue) {},
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 4, 117, 209)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        formKey: _formKey,
                        email: _email,
                        password: _password,
                      ),
                      const SizedBox(height: 16),
                      const DividerWidget(),
                      const SizedBox(height: 25),
                      const SocialMediaIconsWidget(),
                      const SizedBox(height: 16),
                      const LoginOrSignupWidget(),
                      const TermsAndPrivacyWIdget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
