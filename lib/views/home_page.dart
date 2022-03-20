import 'package:firebase_crud/views/add_student_page.dart';
import 'package:firebase_crud/views/listStudent_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('HomePage'),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddStudentPage()));
                },
                child: Text(
                  'Add',
                  textScaleFactor: 1.1,
                )),
          ],
        ),
        centerTitle: true,
      ),
      body: ListStudentPage(),
    );
  }
}
