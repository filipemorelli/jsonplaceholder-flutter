import 'dart:async';
import 'dart:developer';

import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/models/TodoModel.dart';

class TodoBloc {
  static const String urlEndPoint = "todo";
  static final TodoBloc instance = TodoBloc._();

  StreamController<List<TodoModel>> _streamController;
  Stream<List<TodoModel>> get streamTodosModel => _streamController.stream;

  factory TodoBloc() => instance;

  TodoBloc._() {
    _streamController = StreamController.broadcast();
  }

  Future loadTodos() async {
    try {
      _streamController.sink.add(DataBaseBloc.instance.boxTodo.values.toList());
    } catch (e, stackTrace) {
      log(e.toString(),
          name: "TodoBloc.loadTodos", stackTrace: stackTrace);
      return Future.error(e);
    }
  }

  dispose() {
    _streamController.close();
  }
}
