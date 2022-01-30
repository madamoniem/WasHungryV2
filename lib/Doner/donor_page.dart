import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedme/Doner/donate_screen.dart';
import 'package:feedme/Doner/donation_history_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({Key? key}) : super(key: key);

  @override
  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  dynamic firstName;
  dynamic lastName;
  dynamic location;
  dynamic role;
  dynamic rating;
  dynamic userDisplayName;
  dynamic donationsCompleted;
  dynamic peopleHelped;
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((result) {
      result.docs.forEach((result) {
        setState(() {
          rating = result["rating"];
          donationsCompleted = result['donationsCompleted'];
          firstName = result["firstName"];
          lastName = result["lastName"];
          location = result["location"];
          peopleHelped = result["peopleHelped"];
          role = result["role"];
          userDisplayName = result["userDisplayName"];
        });
      });
    });
    final Stream<QuerySnapshot> _donationStream = FirebaseFirestore.instance
        .collection("donations")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 34,
                right: 40,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'Images/menu2.png',
                      height: 25,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'Images/setting.png',
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 34,
                  right: 40,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome\n$firstName',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontFamily: 'rBold',
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 0),
                      child: Container(
                        height: 50,
                        child: NeumorphicButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonateScreen(),
                              ),
                            );
                          },
                          style: NeumorphicStyle(
                            lightSource: LightSource.top,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(50),
                            ),
                            surfaceIntensity: 0,
                            intensity: 10,
                            color: const Color(0xffFA4A0C),
                            shape: NeumorphicShape.concave,
                            depth: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'DONATE',
                                style: TextStyle(
                                  fontFamily: 'tSemibold',
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Stats',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'rBold',
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  'Rating: $rating \nDonations Completed: $donationsCompleted \nPeople Helped: $peopleHelped',
                                  style: const TextStyle(
                                    fontFamily: 'rMedium',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 34,
                      bottom: 10,
                    ),
                    child: Expanded(
                      flex: 1,
                      child: Text(
                        'Donations',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'rBold',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('donations')
                              .where("uid",
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot doc =
                                      snapshot.data!.docs[index];
                                  return adminBonusCard(
                                    title: doc['title'].toString(),
                                    age: doc['age'].toString(),
                                    ageUnit: doc['ageUnit'].toString(),
                                    ageTerm: doc['ageTerm'].toString(),
                                    date: doc['date'].toString(),
                                    quantity: doc['quantity'].toString(),
                                    status: doc['status'].toString(),
                                    type: doc['type'].toString(),
                                  );
                                },
                              );
                            } else {
                              return const Text("No data");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
