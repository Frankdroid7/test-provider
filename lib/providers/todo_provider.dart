import 'package:flutter/foundation.dart';

class TodoProvider extends ChangeNotifier {
  List<String> _todoList = [];

  List<String> get todoList => _todoList;

  set updateTodo(String str) {
    _todoList.add(str);
    notifyListeners();
  }
}
