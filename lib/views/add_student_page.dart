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

  addUser(){
    print('User added');
  }

  void clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
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
        title: Text('Add student data'),
      ),
      body: Form(
        key: formKey,
        child: (Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }
                },
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
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }else if(!value.contains('@')){
                    return 'Enter valid email';
                  }
                  return null;
                },
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
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }
                },
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
                  SizedBox(width: 60,),
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
        )),
      ),
    );
  }
}
