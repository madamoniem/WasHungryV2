import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordReset extends StatelessWidget {
  static String id = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Your Email',
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'rBold'),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    FontAwesomeIcons.at,
                    color: Colors.white,
                  ),
                  errorStyle:
                      TextStyle(color: Colors.white, fontFamily: 'rBold'),
                  labelStyle:
                      TextStyle(color: Colors.white, fontFamily: 'rBold'),
                  hintStyle:
                      TextStyle(color: Colors.white, fontFamily: 'rBold'),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                child: const Text(
                  'Send Email',
                  style: TextStyle(fontFamily: 'rBold'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
