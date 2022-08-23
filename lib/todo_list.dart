import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/providers/todo_provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: context.watch<TodoProvider>().todoList.length,
            itemBuilder: (context, index) {
              return Text(
                context.read<TodoProvider>().todoList[index],
                style: TextStyle(
                  fontSize: 18,
                ),
              );
            }),
      ),
    );
  }
}
