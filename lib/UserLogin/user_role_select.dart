import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedme/Donee/donee_page.dart';
import 'package:feedme/Doner/donor_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'register_page.dart' as userinfo;
import 'user_info.dart' as moreeuserinfo;

class UserRoleSelect extends StatefulWidget {
  const UserRoleSelect({Key? key}) : super(key: key);

  @override
  _UserRoleSelectState createState() => _UserRoleSelectState();
}

class _UserRoleSelectState extends State<UserRoleSelect> {
  final userEmail = userinfo.userEmail;
  final userPassword = userinfo.userPassword;
  final userLocation = moreeuserinfo.userLocation;
  final userFirstName = moreeuserinfo.userFirstName;
  final userLastName = moreeuserinfo.userLastName;
  final userDisplayName = moreeuserinfo.userDisplayName;
  late Function loginAction;
  late final String userRole;
  @override
  Widget build(BuildContext context) {
    Future<void> RegisterUser() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userEmail, password: userPassword);
        FirebaseFirestore.instance.collection('users').add({
          'location': userLocation,
          'firstName': userFirstName,
          'lastName': userLastName,
          'role': userRole,
          'userEmail': userEmail,
          'userPassword': userPassword,
          'userDisplayName': userDisplayName,
          'uid': FirebaseAuth.instance.currentUser!.uid
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Weak Password'),
                ),
              );
            },
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email Already In Use'),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select',
                style: TextStyle(
                  fontFamily: 'rHeavy',
                  fontSize: 57,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userRole = 'Donor';
                        });
                        RegisterUser();
                        loginAction = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonorPage()),
                          );
                        };
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 130),
                        enableFeedback: false,
                        primary: const Color(0xffe7e7e7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Images/Donor.png',
                              width: 70,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'I\'m a Donor',
                                style: TextStyle(
                                    fontFamily: 'rRegular',
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          userRole = 'Donee';
                        });
                        RegisterUser();
                        loginAction = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoneePage()),
                          );
                        };
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(130, 130),
                        enableFeedback: false,
                        primary: const Color(0xffe7e7e7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Images/Donee.png',
                              width: 70,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'I\'m a Donee',
                                style: TextStyle(
                                    fontFamily: 'rRegular',
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
