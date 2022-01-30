import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class adminBonusCard extends StatelessWidget {
  adminBonusCard(
      {required this.title,
      required this.age,
      required this.ageUnit,
      required this.ageTerm,
      required this.date,
      required this.quantity,
      required this.status,
      required this.type});
  final String title;
  final String age;
  final String ageUnit;
  final String ageTerm;
  final String date;
  final String quantity;
  final String status;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        bottom: 20,
        right: 40,
        left: 34,
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(6.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        width: 170,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontFamily: 'rHeavy',
                              color: Color(0xff333333),
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Status: $status',
                        style: const TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14,
                          fontFamily: 'rHeavy',
                        ),
                      ),
                      Text(
                        'Quantity: $quantity',
                        style: const TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14,
                          fontFamily: 'rHeavy',
                        ),
                      ),
                      Text(
                        '$ageTerm' + ': ' + '$age' + ' ' + '$ageUnit',
                        style: const TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14,
                          fontFamily: 'rHeavy',
                        ),
                      ),
                      Text(
                        'Type: $type',
                        style: const TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14,
                          fontFamily: 'rHeavy',
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
    );
  }
}
