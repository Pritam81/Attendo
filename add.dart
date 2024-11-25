// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

// ignore: camel_case_types
class _addState extends State<add> {
  TextEditingController name = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController rolln = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  var ww = '1stCom';
  var options = [
    '1st',
    '2nd',
    '3rd',
    '4th',
  ];
  var _currentItemSelected = "1st";
  var rool = "1st";

  var options1 = [
    'Com',
    'Civ',
  ];
  var _currentItemSelected1 = "Com";
  var rool1 = "Com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add a student',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                )),
          ),
          Container(
            // margin: EdgeInsets.symmetric(vertical: 00),
            margin: EdgeInsets.only(top: 200),
            color: Colors.white,

            height: 1000,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 150, 20, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 0.7, blurRadius: 6)
                ]),
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    textAlign: TextAlign.left,
                    controller: name,
                    //ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.amber,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 2),
                        ),
                        labelText: "Full Name",
                        hintText: "Eg - PRITAM STP"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    textAlign: TextAlign.left,
                    controller: rolln,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      prefixIcon: Icon(
                        Icons.app_registration,
                        color: Colors.amber,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                      labelText: "Roll Number",
                      hintText: "Eg:21csec14/21cvlc17",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Year: '),
                        DropdownButton<String>(
                          dropdownColor: Colors.amber,
                          //    isDense: true,
                          isExpanded: false,
                          iconEnabledColor: Colors.amber,
                          focusColor: const Color.fromARGB(255, 0, 17, 251),
                          items: options.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(
                                dropDownStringItem,
                                style: const TextStyle(
                                  //  color: Color.fromARGB(255, 226, 226, 226),
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              _currentItemSelected = newValueSelected!;
                              rool = newValueSelected;

                              ww = '';
                              ww = _currentItemSelected + _currentItemSelected1;
                            });
                          },
                          value: _currentItemSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Row(
                      children: [
                        const Text('Dep: '),
                        DropdownButton<String>(
                          dropdownColor: Colors.amber,
                          isDense: true,
                          isExpanded: false,
                          iconEnabledColor: Colors.amber,
                          focusColor: Colors.blue[900],
                          items: options1.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(
                                dropDownStringItem,
                                style: const TextStyle(
                                  // color: Color.fromARGB(255, 0, 0, 0),
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValueSelected1) {
                            setState(() {
                              _currentItemSelected1 = newValueSelected1!;
                              rool1 = newValueSelected1;
                              ww = '';
                              ww = _currentItemSelected + _currentItemSelected1;
                            });
                          },
                          value: _currentItemSelected1,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    // Fluttertoast.showToast(
                    //     msg: "Student added successfully",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     timeInSecForIosWeb: 2,
                    //     backgroundColor: Colors.amber,
                    //     textColor: Colors.white,
                    //     fontSize: 12.0);
                    ref.add({
                      'name': name.text,
                      'div': ww,
                      'roll': rolln.text,
                    });
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
