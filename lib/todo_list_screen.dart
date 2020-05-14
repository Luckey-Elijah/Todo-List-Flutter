import 'package:flutter/material.dart';
import 'new_todo_dialog.dart';
import 'todo_list.dart';
import 'todo.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  // Floating action button on press => add todo
  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TodoList(
        onTodoToggle: _toggleTodo,
        todos: todos,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
