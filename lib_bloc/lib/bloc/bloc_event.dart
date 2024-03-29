import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lib_bloc/model/todo.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class ListTodosEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final Todo todo;

  CreateTodoEvent({
    required this.todo,
  });

  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent({
    required this.todo,
  });

  @override
  List<Object> get props => [todo];
}
