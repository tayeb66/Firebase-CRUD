import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/firebase_crud1/home_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {

  Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context,snapshot){
        if(snapshot.hasError){
         print('Something wrong');
        }else if(snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage1(),

          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
