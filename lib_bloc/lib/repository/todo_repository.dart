import 'package:lib_bloc/model/todo.dart';

class TodoRepository {
  Future<List<Map<String, dynamic>>> listTodo() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        'id': '1',
        'title': 'Flutter 배우기',
        'createdAt': DateTime.now().toString(),
      },
      {
        'id': '2',
        'title': 'Dart 배우기',
        'createdAt': DateTime.now().toString(),
      },
    ];
  }

  Future<Map<String, dynamic>> createTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));

    return todo.toJson();
  }

  Future<Map<String, dynamic>> deletedTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));

    return todo.toJson();
  }
}