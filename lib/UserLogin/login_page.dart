import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedme/Donee/donee_page.dart';
import 'package:feedme/Doner/donor_page.dart';
import 'package:feedme/UserLogin/password_reset.dart';
import 'package:feedme/UserLogin/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late final role;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) async {
        if (user == null) {
        } else {
          print(FirebaseAuth.instance.currentUser!.uid);
          FirebaseFirestore.instance
              .collection("users")
              .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots()
              .listen(
            (result) {
              result.docs.forEach(
                (result) {
                  setState(
                    () {
                      role = result["role"];
                      if (role == 'Donor') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonorPage(),
                          ),
                        );
                        print('Donor Page');
                      } else if (role == 'Donee') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoneePage(),
                          ),
                        );
                        print(FirebaseAuth.instance.currentUser!.uid);
                      }
                    },
                  );
                },
              );
            },
          );
        }
      },
    );

    Future<void> login(BuildContext context) async {
      try {
        // ignore: unused_local_variable
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        print('dddd');
        FirebaseFirestore.instance
            .collection("users")
            .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots()
            .listen((result) {
          result.docs.forEach((result) {
            setState(() {
              role = result["role"];
            });
          });
        });
        if (role == 'Donor') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DonorPage()),
          );
          print('Donor Page');
        } else if (role == 'Donee') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DoneePage()),
          );
          print('Donee Page');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('No account found for this email'),
            ));
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Wrong password for this account'),
            ));
          });
        }
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
                      'Log In',
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
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: NeumorphicButton(
                        onPressed: () {
                          login(context);
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
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'rBold',
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PasswordReset(),
                                ),
                              );
                            },
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontFamily: 'tMedium'),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Register',
                                  style: TextStyle(fontFamily: 'tMedium'),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -44,
              left: -44,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'Images/globe.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
