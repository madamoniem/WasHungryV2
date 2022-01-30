import 'package:feedme/Donate/donate_food.dart';
import 'package:feedme/Donate/donate_other.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 34,
                right: 40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Donate',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      fontFamily: 'tSemibold',
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Text(
                  'Donate',
                  style: TextStyle(
                    fontFamily: 'rHeavy',
                    fontSize: 60,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 40,
                ),
                child: Text(
                  'What Do You Want To Do Donate?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'rMedium',
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonateFood(),
                          ),
                        );
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            child: Container(
                              width: 135,
                              height: 135,
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                  surfaceIntensity: 0,
                                  border: const NeumorphicBorder(
                                    color: Color(0xffc7c7c7),
                                    width: 2,
                                  ),
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(12)),
                                  lightSource: LightSource.topRight,
                                  color: const Color(0x9ad7d7d7),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 10,
                            child: Image.asset(
                              'Images/Coffee.png',
                              height: 110,
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 60,
                            child: Image.asset(
                              'Images/Apple.png',
                              height: 110,
                            ),
                          ),
                          const Positioned(
                            top: 100,
                            child: Text(
                              'Food',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'rBold',
                                  fontSize: 22,
                                  color: Color(0xff4e4e4e)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonateOther(),
                          ),
                        );
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            child: Container(
                              width: 135,
                              height: 135,
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                    surfaceIntensity: 0,
                                    border: const NeumorphicBorder(
                                      color: Color(0xffc7c7c7),
                                      width: 2,
                                    ),
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(12)),
                                    lightSource: LightSource.topRight,
                                    color: const Color(0x9ad7d7d7)),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 1,
                            child: Image.asset(
                              'Images/BookStacks.png',
                              height: 140,
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 20,
                            child: Image.asset(
                              'Images/Shoe.png',
                              height: 45,
                            ),
                          ),
                          const Positioned(
                            top: 100,
                            child: Text(
                              'Other',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'rBold',
                                fontSize: 22,
                                color: Color(0xff4e4e4e),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                top: 30,
                              ),
                              child: Image.asset(
                                'Images/TrashBin.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'Images/Trash2.png',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: Image.asset(
                              'Images/Trash1.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
