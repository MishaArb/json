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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 2;
  int h = 3;
  int res = 0;
  void ff(int a, int s) {
    setState(() {
      res =a + s;
    });

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
              Text('${res}'),
              Text('Пока'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ff(i, h);
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
