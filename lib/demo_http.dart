import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Center(
            child:FutureBuilder(
                future: getAllTodos(18),
                builder: (context, snapshot) {
                  if(snapshot.hasData && snapshot.data != null){
                    final todos = snapshot.data!;
                    return ListView.builder(
                      itemCount: todos.length,
                      itemBuilder:(context, index) =>
                          ListTileTodo(todo: todos[index])
                    );
                  }else{
                    return Text("En cours de chargement..");
                  }
                }
            )
        ),
      ),
    );
  }
}

class ListTileTodo extends StatelessWidget {
  const ListTileTodo({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(todo.completed ?
                    Icons.check_box_outlined :
                    Icons.check_box_outline_blank),
      title: Text(todo.title),
      subtitle: Text("Posté par ${todo.userId}"),
    );
  }
}

Future<List<Todo>> getAllTodos(int id) async{
  final responseTodo = get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  String body = (await responseTodo).body;
  List<dynamic> listMapTodo = jsonDecode(body) as List<dynamic>;
  List<Todo> listTodos = listMapTodo.map(
          (map)=> Todo.fromMap(map as Map<String,dynamic>)
  ).toList();
  return listTodos;
}

class Todo{
  int userId;
  int id;
  String title;
  bool completed;

//<editor-fold desc="Data Methods">

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Todo &&
              runtimeType == other.runtimeType &&
              userId == other.userId &&
              id == other.id &&
              title == other.title &&
              completed == other.completed
          );


  @override
  int get hashCode =>
      userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      completed.hashCode;


  @override
  String toString() {
    return 'Todo{' +
        ' userId: $userId,' +
        ' id: $id,' +
        ' title: $title,' +
        ' completed: $completed,' +
        '}';
  }

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'completed': this.completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

//</editor-fold>
}







