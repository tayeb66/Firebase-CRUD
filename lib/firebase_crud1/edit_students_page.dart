import 'package:flutter/material.dart';

class EditStudentsPage1 extends StatefulWidget {
  const EditStudentsPage1({Key? key}) : super(key: key);

  @override
  State<EditStudentsPage1> createState() => _EditStudentsPage1State();
}

class _EditStudentsPage1State extends State<EditStudentsPage1> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  void clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditStudentsPage'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: nameController,
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name',
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: emailController,
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }else if(!value.contains('@')){
                    return 'Enter valid email';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value){
                  if(value!.isEmpty || value == null){
                    return 'Field must be not empty';
                  }else if(value.length < 6){
                    return 'password must contain atleast 6 character';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                  labelText: 'password',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        setState(() {
                          clearText();
                        });
                      }

                    },
                    child: Text('Update'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      clearText();
                    },
                    child: Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
