import 'package:flutter/material.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Row(
              children: [
                Container(width: 10, height: 10,color: Colors.red,),
                Text('new  Text'),
              ],
            ),
          ),
        ));
  }
}
