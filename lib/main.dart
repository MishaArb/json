import 'dart:async';

import 'package:flutter/material.dart';


import 'new_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage() ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
StreamController<int> controller = StreamController<int>();
StreamSubscription<int>? subscription;




@override
  void initState() {
  controller.add(1);
  controller.add(2);
  controller.add(3);
  print('one');
  subscription = controller.stream.listen((event) {
    print(event);
    if(event == 4){
      subscription?.cancel();
    }
  });
  controller.add(4);
  controller.add(5);
  controller.add(6);


  Future.delayed(Duration(seconds: 10), (){
    subscription?.cancel();
  });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const TextField(),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Text('Привет',),
              Text('Change text'),
                Text('Пока'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UserData {
  final int userId;
  final int id;
  final String title;

  UserData({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      // body: json['body'],
    );
  }
}

class User {
  final name;
  final sername;
  final age;

  void getUser() {
    print('Hello user: ${name}, ${sername}, ${age}');
  }

  User({required this.name, this.sername, this.age});
}
