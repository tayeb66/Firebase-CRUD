import 'package:firebase_crud/firebase_crud1/edit_students_page.dart';
import 'package:flutter/material.dart';

class ListStudentsPage1 extends StatefulWidget {
  const ListStudentsPage1({Key? key}) : super(key: key);

  @override
  State<ListStudentsPage1> createState() => _ListStudentsPage1State();
}

class _ListStudentsPage1State extends State<ListStudentsPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'List of students',
              textScaleFactor: 1.3,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                columnWidths: <int, TableColumnWidth>{
                  2: FixedColumnWidth(80),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(
                    color: Colors.purple, width: 2.0, style: BorderStyle.solid),
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    TableCell(
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text('Email',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    TableCell(
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text('Age',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                    TableCell(
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text('',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Tayeb Ahmed'),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('tayeb@gmail.com'),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('111'),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditStudentsPage1()));
                            },
                            icon: Icon(Icons.add)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
