// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'makepdf.dart';

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
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
  var rool1 = "Civ";

  var temp = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where(
          'div',
          isEqualTo: ww,
        )
        .snapshots();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => reportt(
                  list: temp,
                  clas: ww,
                ),
              ),
            );
          },
          child: Icon(
            Icons.send,
            // color: Colors.amber,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 5),
              DropdownButton<String>(
                dropdownColor: Color.fromARGB(255, 255, 255, 255),
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
                items: options.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
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
              SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                dropdownColor: Color.fromARGB(255, 255, 255, 255),
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
                items: options1.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
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
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      // 1019
                      setState(() {
                        if (temp.contains(
                            snapshot.data!.docChanges[index].doc['name'])) {
                          temp.remove(
                              snapshot.data!.docChanges[index].doc['name']);
                        } else {
                          temp.add(
                              snapshot.data!.docChanges[index].doc['name']);
                        }
                      });

                      setState(() {});
                    },
                    child: Card(
                      child: ListTile(
                        title:
                            Text(snapshot.data!.docChanges[index].doc['name']),
                        trailing: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: temp.contains(snapshot
                                    .data!.docChanges[index].doc['name'])
                                ? Color.fromARGB(255, 248, 20, 4)
                                : Color.fromARGB(255, 0, 228, 8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              temp.contains(snapshot
                                      .data!.docChanges[index].doc['name'])
                                  ? 'done'
                                  : 'Present',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
