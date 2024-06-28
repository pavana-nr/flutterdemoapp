import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required String email,
  })  : _formKey = formKey,
        _email = email;

  final GlobalKey<FormState> _formKey;
  final String _email;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          if (kDebugMode) {
            print(_email);
          }
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
