import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/firebase_crud1/add_student_page.dart';
import 'package:firebase_crud/firebase_crud1/edit_student_page.dart';
import 'package:flutter/material.dart';

class ListStudentPage1 extends StatefulWidget {
  const ListStudentPage1({Key? key}) : super(key: key);

  @override
  State<ListStudentPage1> createState() => _ListStudentPage1State();
}

class _ListStudentPage1State extends State<ListStudentPage1> {
  /// Data return to Stream reference
  /// from Firebase collection in firebase
  Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  /// CollectionReference query from collection in firestore
  CollectionReference reference =
      FirebaseFirestore.instance.collection('students');
  /// delete data through document id docs(id)
  Future<void> deleteUser(id) {
    return reference
        .doc(id)
        .delete()
        .then((value) => print('Deleted User'))
        .catchError((error) => print('Failed to delete user $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: studentsStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('Something wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        /// Fetch data from FirebaseFirestore
        List storeDocs = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map map = document.data() as Map<String, dynamic>;

          ///catch document using id
          map['id'] = document.id;
          storeDocs.add(map);
        }).toList();

        return Scaffold(
          backgroundColor: Colors.blue,
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
                  for (var i = 0; i < storeDocs.length; i++) ...[
                    TableRow(children: [
                      TableCell(
                        child: Container(
                          child: Text(storeDocs[i]['name']),
                          alignment: Alignment.center,
                        ),
                      ),
                      TableCell(
                        child: Container(
                          child: Text(storeDocs[i]['email']),
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
                                        builder: (context) =>
                                            EditStudentPage1(id: storeDocs[i]['id'],)));
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                deleteUser(storeDocs[i]['id']);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      )),
                    ]),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
