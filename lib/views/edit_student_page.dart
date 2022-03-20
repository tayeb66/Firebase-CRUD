import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditStudentPage extends StatefulWidget {
  final String id;

  const EditStudentPage({Key? key, required this.id}) : super(key: key);

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  var formKey = GlobalKey<FormState>();

  /// Edit/Update User information
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> updateUser(id, name, email, password) async {
   return students
        .doc(id)
        .update({'name': name, 'email': email, 'password': password})
        .then((value) => print('User updated'))
        .catchError((error) => print('User update failed : $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student data'),
      ),
      body: Form(
        key: formKey,

        ///Getting specific data by id
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('students')
              .doc(widget.id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Something error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data!.data();
            var name = data!['name'];
            var email = data['email'];
            var password = data['password'];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    initialValue: name,
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Field must be not empty';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder()),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    initialValue: email,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Field must be not empty';
                      } else if (!value.contains('@')) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter email',
                        labelText: 'email',
                        labelStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder()),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    initialValue: password,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Field must be not empty';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'password',
                        labelStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            updateUser(widget.id, name, email, password);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Update'),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Reset'),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
