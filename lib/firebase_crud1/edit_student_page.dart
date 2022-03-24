import 'package:flutter/material.dart';

class EditStudentPage1 extends StatefulWidget {
  const EditStudentPage1({Key? key}) : super(key: key);

  @override
  State<EditStudentPage1> createState() => _EditStudentPage1State();
}

class _EditStudentPage1State extends State<EditStudentPage1> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  updateUser(){
    print('User added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditStudentPage1'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                initialValue: 'tayeb',
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
                initialValue: 'tayeb@gmail.com',
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
               initialValue: '123456789',
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
                        if(formKey.currentState!.validate()){
                          Navigator.pop(context);
                          clearText();
                        }
                      },
                      child: Text('Update')),
                  ElevatedButton(onPressed: () {
                    clearText();
                  }, child: Text('Reset')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
