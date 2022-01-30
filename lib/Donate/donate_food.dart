import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';

class DonateFood extends StatefulWidget {
  const DonateFood({Key? key}) : super(key: key);

  @override
  _DonorOtherState createState() => _DonorOtherState();
}

class _DonorOtherState extends State<DonateFood> {
  @override
  String dropdownValue = '';
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
                  const Text(
                    'Add Info',
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
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              AwesomeDropDown(
                isPanDown: _isPanDown,
                dropDownList: _list,
                dropDownIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 23,
                ),
                selectedItem: dropdownValue,
                onDropDownItemClick: (selectedItem) {
                  dropdownValue = selectedItem;
                },
                dropStateChanged: (isOpened) {
                  _isDropDownOpened = isOpened;
                  if (!isOpened) {
                    _isBackPressedOrTouchedOutSide = false;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
