import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';
import '../components/todo_insert_field.dart';
import '../components/todo_component.dart';
import '../components/todo_list.dart';

class TodosScreen extends StatefulWidget {
  // final List<Todo> todos;
  const TodosScreen({super.key});

  // TodosScreen(this.todos);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Todo> todos = [];

  // 定義一個方法, 傳入 todo title 字串後,
  void addTodo(String newTodoTitle) {
    var uuid = const Uuid();
    setState(() {
      todos.add(Todo(uuid.v4(), newTodoTitle, "", false));
    });
  }

  // 定義一個方法, 觸發後將 todo從清單移除
  void deleteTodo(Todo todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        TextFieldWidget(addTodo),
        TodoList(todos, deleteTodo: deleteTodo),
      ],
    ));
  }
}
