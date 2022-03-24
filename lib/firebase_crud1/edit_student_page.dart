import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditStudentPage1 extends StatefulWidget {
  final String id;

  const EditStudentPage1({Key? key, required this.id}) : super(key: key);

  @override
  State<EditStudentPage1> createState() => _EditStudentPage1State();
}

class _EditStudentPage1State extends State<EditStudentPage1> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  ///Update data
  CollectionReference reference =
      FirebaseFirestore.instance.collection('students');

  Future<void> updateData(id, name, email, password) {
    return reference
        .doc(id)
        .update({'name': name, 'email': email, 'password': password})
        .then((value) => print('Update user'))
        .catchError((error) => print('Update user failed $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditStudentPage1'),
      ),
      body: Form(
        key: formKey,

        /// getting data by ID
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('students')
              .doc(widget.id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Something wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            /// documentSnapshot data return on data()
            /// data() is a type of documentSnapshot
            var data = snapshot.data!.data();
            var name = data!['name'];
            var email = data['email'];
            var password = data['password'];

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    initialValue: name,
                    onChanged: (value) => name = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must be not empty';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                      labelText: 'Name',
                      contentPadding: EdgeInsets.only(left: 8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    initialValue: email,
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must be not empty';
                      } else if (!value.contains('@')) {
                        return 'Enter valid Email';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Email',
                      contentPadding: EdgeInsets.only(left: 8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    initialValue: password,
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must be not empty';
                      } else if (value.length < 6) {
                        return 'password must be more six character';
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      contentPadding: EdgeInsets.only(left: 8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              updateData(widget.id, name, email, password);
                              Navigator.pop(context);
                              clearText();
                            }
                          },
                          child: Text('Update')),
                      ElevatedButton(
                          onPressed: () {
                            clearText();
                          },
                          child: Text('Reset')),
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
