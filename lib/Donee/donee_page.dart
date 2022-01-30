import 'package:feedme/UserLogin/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoneePage extends StatefulWidget {
  const DoneePage({Key? key}) : super(key: key);

  @override
  _DoneePageState createState() => _DoneePageState();
}

class _DoneePageState extends State<DoneePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              children: [
                Text(
                  'Welcome',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 4,
          child: Container(),
        )
      ],
    );
  }
}
