import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/firebase_crud1/edit_student_page.dart';
import 'package:flutter/material.dart';

class AddStudentPage1 extends StatefulWidget {
  const AddStudentPage1({Key? key}) : super(key: key);

  @override
  State<AddStudentPage1> createState() => _AddStudentPage1State();
}

class _AddStudentPage1State extends State<AddStudentPage1> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var name = '';
  var email = '';
  var password = '';

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  /// CollectionReference query from collection in firestore
  CollectionReference reference =
      FirebaseFirestore.instance.collection('students');
 /// Added user through this method
  Future<void> addUser() {
    return reference
        .add({'name': name, 'email': email, 'password': password})
        .then((value) => print('User Added'))
        .catchError((error) => print('Added failed'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddStudentPage'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                controller: nameController,
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
                controller: emailController,
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
                controller: passwordController,
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
                          setState(() {
                            name = nameController.text;
                            email = emailController.text;
                            password = passwordController.text;
                            Navigator.pop(context);
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text('Register')),
                  ElevatedButton(
                      onPressed: () {
                        clearText();
                      },
                      child: Text('Reset')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
