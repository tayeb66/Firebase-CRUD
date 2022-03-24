import 'package:firebase_crud/firebase_crud1/add_student_page.dart';
import 'package:firebase_crud/firebase_crud1/student_list_page.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Firebase CRUD'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStudentPage1()));
              },
              child: Text('Add')),
        ],
      ),),
      body: ListStudentPage1(),
    );
  }
}
