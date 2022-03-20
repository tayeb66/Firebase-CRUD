import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/views/home_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  /// Initialize firebaseApp
  Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    /// Future data pass throw with FutureBuilder()
    /// and data receive with snapshot
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          print('Something wrong');
        }
        if(snapshot.connectionState == ConnectionState.done){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
