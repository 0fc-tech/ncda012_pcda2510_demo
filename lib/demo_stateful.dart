import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("$_counter");
    return Scaffold(
      appBar: AppBar(title: Text('appbarTitle')),
      body: Text("Valeur du compteur : $_counter"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _counter+=1;
          });
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}














