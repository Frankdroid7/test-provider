import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/providers/card_properties_provider.dart';
import 'package:test_provider/providers/todo_provider.dart';
import 'package:test_provider/todo_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = true;

  TextEditingController todoCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Provider'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TodoList();
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text(
                  context.watch<TodoProvider>().todoList.length.toString()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: todoCtrl,
              decoration: InputDecoration(
                hintText: 'Enter your todo...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (todoCtrl.text.isNotEmpty) {
                  context.read<TodoProvider>().updateTodo = todoCtrl.text;
                  todoCtrl.clear();

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Todo Added')));
                }
              },
              child: Text('Save TODO'),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 100,
              height: context.watch<CardProperties>().height,
              child: Card(
                color: context.watch<CardProperties>().cardColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularButton(color: Colors.orange),
                CircularButton(color: Colors.purple),
                CircularButton(color: Colors.yellow),
                CircularButton(color: Colors.black),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CardProperties>().changeCardHeight = 200;
              },
              child: Text('Change card height'),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color color;
  const CircularButton({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CardProperties>().changeCardColor = color;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: color,
        ),
      ),
    );
  }
}
