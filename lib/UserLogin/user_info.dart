import 'package:feedme/UserLogin/user_role_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

late final String userLocation;
late final String userFirstName;
late final String userLastName;
late final String userDisplayName;

class _UserInfoState extends State<UserInfo> {
  final TextEditingController _location = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  Widget build(BuildContext context) {
    void saveInfo() async {
      userLocation = _location.text;
      userFirstName = _firstName.text;
      userLastName = _lastName.text;
      userDisplayName = _displayName.text;

      if (_location.text.isEmpty == true ||
          _firstName.text.isEmpty == true ||
          _lastName.text.isEmpty == true ||
          _displayName.text.isEmpty == true) {
        showTopSnackBar(
          context,
          const CustomSnackBar.error(
            message: "Fields Can Not Be Left Blank",
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserRoleSelect(),
          ),
        );
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
                      'Info',
                      style: TextStyle(
                        fontFamily: 'rHeavy',
                        fontSize: 57,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: TextFormField(
                        controller: _location,
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
                          icon: const Icon(FontAwesomeIcons.mapMarkerAlt),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Location',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _firstName,
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
                          icon: const Icon(FontAwesomeIcons.signature),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'First Name',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _lastName,
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
                          icon: const Icon(FontAwesomeIcons.signature),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Last Name',
                          hintStyle: const TextStyle(fontFamily: 'rRegular'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _displayName,
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
                          icon: const Icon(FontAwesomeIcons.signature),
                          filled: true,
                          fillColor: const Color(0xfff0f0f0),
                          hintText: 'Display Name',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserRoleSelect(),
                            ),
                          );
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
