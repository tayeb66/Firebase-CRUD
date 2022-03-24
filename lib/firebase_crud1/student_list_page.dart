import 'package:firebase_crud/firebase_crud1/add_student_page.dart';
import 'package:firebase_crud/firebase_crud1/edit_student_page.dart';
import 'package:flutter/material.dart';

class ListStudentPage1 extends StatefulWidget {
  const ListStudentPage1({Key? key}) : super(key: key);

  @override
  State<ListStudentPage1> createState() => _ListStudentPage1State();
}

class _ListStudentPage1State extends State<ListStudentPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            border: TableBorder.all(color: Colors.purple, width: 2.0),
            columnWidths: <int, TableColumnWidth>{
              1: FixedColumnWidth(140),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                TableCell(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Text(
                      'Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.orange,
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text(
                        'Action',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Container(
                    child: Text('tayeb'),
                    alignment: Alignment.center,
                  ),
                ),
                TableCell(
                  child: Container(
                    child: Text('tayebahmed@gmail.com'),
                    alignment: Alignment.center,
                  ),
                ),
                TableCell(
                    child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditStudentPage1()));
                        },
                        icon: Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
