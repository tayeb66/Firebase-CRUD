import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: (Column(
          children: [
            Text(
              'Add student data',
              textScaleFactor: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: nameController,
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
                controller: emailController,
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
                controller: passwordController,
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
                    onPressed: () {},
                    child: Text('Register'),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
