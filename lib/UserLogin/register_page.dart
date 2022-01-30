import 'package:feedme/UserLogin/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

late final String userEmail;
late final String userPassword;

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void saveInfo() async {
      if (_email.text == '' ||
          _password.text == '' ||
          _passwordConfirmation.text == '') {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Fields Can Not Be Left Blank",
          ),
        );
      } else if (_password.text != _passwordConfirmation.text) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Passwords Do Not Match",
          ),
        );
      } else if (_password.text.length < 6) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Password Must Be At Least 6 Characters Long",
          ),
        );
      } else {
        userEmail = _email.text;
        userPassword = _password.text;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserInfo(),
          ),
        );
        print(userEmail);
        print(userPassword);
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Container(
                width: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'rHeavy',
                        fontSize: 57,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: const EdgeInsets.only(left: 22),
                          icon: const Icon(FontAwesomeIcons.at),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Email',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: const EdgeInsets.only(left: 22),
                          icon: const Icon(FontAwesomeIcons.lock),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Password',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _passwordConfirmation,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xfff0f0f0), width: 0.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: const EdgeInsets.only(left: 22),
                          icon: const Icon(FontAwesomeIcons.lock),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: NeumorphicButton(
                        onPressed: () {
                          saveInfo();
                        },
                        style: NeumorphicStyle(
                          lightSource: LightSource.top,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20),
                          ),
                          surfaceIntensity: 0.3,
                          intensity: 0.8,
                          color: const Color(0xff258AE5),
                          shape: NeumorphicShape.concave,
                          depth: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: NeumorphicIcon(
                                FontAwesomeIcons.signInAlt,
                                style: const NeumorphicStyle(
                                  intensity: 1.00,
                                  surfaceIntensity: 1.00,
                                  shape: NeumorphicShape.convex,
                                  depth: 100, //customize depth here
                                  color: Colors.white, //customize color here
                                ),
                                size: 30,
                              ),
                            ),
                            const Text(
                              'Register',
                              style: TextStyle(
                                  fontFamily: 'rBold',
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
