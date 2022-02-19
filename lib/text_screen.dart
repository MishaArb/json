import 'package:flutter/material.dart';

// Создаил InheritedWidget
class MyInherited extends InheritedWidget {
  final int value;
  final int valueTwo;

  const MyInherited({
    Key? key,
    required this.value,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  // static MyInherited of(BuildContext context) {
  //   final MyInherited? result = context.dependOnInheritedWidgetOfExactType<MyInherited>();
  //   assert(result != null, 'No MyInherited found in context');
  //   return result!;
  // }

  @override
  bool updateShouldNotify(MyInherited old) {
    return value != old.value || valueTwo != old.valueTwo;
  }
}

class TextScreen extends StatefulWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  _TextScreenState createState() => _TextScreenState();
}
class _TextScreenState extends State<TextScreen> {
  int _value = 0;
  int _valueTwo = 100;
 void increment(){
   setState(() {
     _value++;
     _valueTwo++;
   });
 }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed:increment, child: Text('Жми')),
 // Обернули в InheritedWidget наш родительский виджет ResultWidget
                MyInherited(
                value: _value,
                valueTwo: _valueTwo,
                child: ResultWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Передали значение в следующий виджет
    final value = context.dependOnInheritedWidgetOfExactType<MyInherited>()?.value ?? 0;
    final valueTwo = context.dependOnInheritedWidgetOfExactType<MyInherited>()?.valueTwo ?? 0;
    return Column(
      children: [
        Text('$value'),
        Text('${valueTwo + 1}'),
      ],
    );
  }
}


