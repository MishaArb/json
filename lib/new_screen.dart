import 'package:flutter/material.dart';
import 'package:json/text_screen.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
      child: Center(
        child: Row(
          children: [
            Text('Hello World'),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen()));
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
