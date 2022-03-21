import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStudentsPage1 extends StatefulWidget {
  const AddStudentsPage1({Key? key}) : super(key: key);

  @override
  State<AddStudentsPage1> createState() => _AddStudentsPage1State();
}

class _AddStudentsPage1State extends State<AddStudentsPage1> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  String name = '';
  String email = '';
  String password = '';

  void clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void addUser(){
    print('User added');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddStudentsPage1'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Fields must be not empty';
                  }
                },
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Fields must be not empty';
                  }else if(!value.contains('@')){
                    return 'Enter valid email';
                  }
                },
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Fields must be not empty';
                  }else if(value.length <6){
                    return 'Password must contain 6 character';
                  }
                },
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        setState(() {
                          name = nameController.text;
                          email = emailController.text;
                          password = passwordController.text;

                          addUser();
                          clearText();
                        });
                      }

                    },
                    child: Text('Register'),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      clearText();
                    },
                    child: Text('Reset'),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
