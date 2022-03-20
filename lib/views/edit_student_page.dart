import 'package:flutter/material.dart';

class EditStudentPage extends StatefulWidget {
  const EditStudentPage({Key? key}) : super(key: key);

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  var formKey = GlobalKey<FormState>();

  void updateUser() {
    print('Update user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student data'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: (value) {},
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
                onChanged: (value) {},
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
                onChanged: (value) {},
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
                        setState(() {
                          updateUser();
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text('Update'),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  SizedBox(
                    width: 60,
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
        ),
      ),
    );
  }
}
