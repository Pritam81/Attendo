// ignore_for_file: use_key_in_widget_constructors, camel_case_types

//import 'package:pdf/widgets.dart';

import 'add.dart';
import 'mainpage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //var h = MediaQuery.of(context).size.height;
    //var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 255, 255, 250),
        centerTitle: true,
        title: const Text(
          'Attendance made easy',
          style: TextStyle(
              color: Colors.amber, fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Align(
                alignment: Alignment.center,
                child: Card(
                  child: Image.asset('assets/images/register.jpg'),
                )),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20),
                        backgroundColor: Colors.amber),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => mainpage()));
                    },
                    child: const Text(
                      "Take Attendance",
                      style: TextStyle(fontSize: 16),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 110, vertical: 20),
                      backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => add()));
                  },
                  child: const Text(
                    "Add a student",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20),
                        backgroundColor: Colors.amber),
                    onPressed: () {},
                    child: const Text(
                      "Remove Student",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
