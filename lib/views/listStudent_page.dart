import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/views/edit_student_page.dart';
import 'package:flutter/material.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  /// data fetch from firebase using Stream
  /// QuerySnapshot contains the results of a query.
  /// It can contain zero or more DocumentSnapshot objects
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  CollectionReference student =
      FirebaseFirestore.instance.collection('students');

  /// Using this method to delete id
  /// id contain user information
  Future<void> deleteUser(id) async {
   return student
        .doc(id)
        .delete()
        .then((value) => print('User deleted'))
        .catchError((error) => print('Failed to delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: studentsStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('Something error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        ///Bring data from document and store on storeDocuments
        ///A DocumentSnapshot contains data read
        /// from a document in your FirebaseFirestore database
        final List storeDocuments = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map map = document.data() as Map<String, dynamic>;
          storeDocuments.add(map);
          map['id'] = document.id;
        }).toList();

        return Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Text(
                  'List student page',
                  textScaleFactor: 1.3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.purple,
                        width: 2.0,
                        style: BorderStyle.solid),
                    columnWidths: <int, TableColumnWidth>{
                      1: FixedColumnWidth(140),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Action',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      ///appearing to list data from document
                      ///using for loop
                      for (var i = 0; i < storeDocuments.length; i++) ...[
                        TableRow(children: [
                          TableCell(
                            child: Container(
                              child: Center(
                                child: Text(
                                  storeDocuments[i]['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: Center(
                                child: Text(
                                  storeDocuments[i]['email'],
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditStudentPage(id:storeDocuments[i]['id'],)));
                                      },
                                      icon: Icon(Icons.add)),
                                  IconButton(
                                      onPressed: () {
                                      deleteUser(storeDocuments[i]['id']);
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
