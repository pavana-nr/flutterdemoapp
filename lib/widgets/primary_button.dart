import 'dart:convert';

import 'package:assignment1/services/api_service.dart';
import 'package:assignment1/views/home_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required String email,
    required String password,
  })  : _formKey = formKey,
        _email = email,
        _password = password;

  final GlobalKey<FormState> _formKey;
  final String _email;
  final String _password;
  late String passwd;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          var bytes = utf8.encode(_password); // Data being hashed
          final Digest digest = sha256.convert(bytes);
          final String hashedPassword = digest.toString();
          Provider.of<ApiService>(context, listen: false)
              .login(_email, hashedPassword);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50.0),
        backgroundColor: const Color.fromARGB(255, 203, 206, 203),
      ),
      child: const Text(
        'Submit',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
