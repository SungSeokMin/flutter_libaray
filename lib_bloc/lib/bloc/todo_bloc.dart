import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lib_bloc/bloc/todo_event.dart';
import 'package:lib_bloc/bloc/todo_state.dart';
import 'package:lib_bloc/model/todo.dart';
import 'package:lib_bloc/repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({
    required this.repository,
  }) : super(Empty());

  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is ListTodosEvent) {
      yield* _mapListTodoEvent(event);
    } else if (event is CreateTodoEvent) {
      yield* _mapCreateTodoEvent(event);
    } else if (event is DeleteTodoEvent) {
      yield* _mapDeleteTodoEvent(event);
    }
  }

  Stream<TodoState> _mapListTodoEvent(ListTodosEvent event) async* {
    try {
      yield Loading();

      final response = await repository.listTodo();
      final todos = response.map<Todo>((e) => Todo.fromJson(e)).toList();

      yield Loaded(todos: todos);
    } catch (error) {
      yield Error(message: error.toString());
    }
  }

  Stream<TodoState> _mapCreateTodoEvent(CreateTodoEvent event) async* {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);

        final newTodo = Todo(
          id: parsedState.todos[parsedState.todos.length - 1].id + 1,
          title: event.title,
          createdAt: DateTime.now().toString(),
        );

        final prevTodos = [...parsedState.todos];
        final newTodos = [...prevTodos, newTodo];

        yield Loaded(todos: newTodos);

        final response = await repository.createTodo(newTodo);

        yield Loaded(todos: [...prevTodos, Todo.fromJson(response)]);
      }
    } catch (error) {
      yield Error(message: error.toString());
    }
  }

  Stream<TodoState> _mapDeleteTodoEvent(DeleteTodoEvent event) async* {
    try {
      if (state is Loaded) {
        final newTodos = (state as Loaded).todos.where((todo) => todo.id != event.todo.id).toList();

        yield Loaded(todos: newTodos);

        await repository.deletedTodo(event.todo);
      }
    } catch (error) {
      yield Error(message: error.toString());
    }
  }
}
