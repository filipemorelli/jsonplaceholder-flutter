import 'dart:async';
import 'dart:developer';

import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/models/UserModel.dart';

class UserBloc {
  static const String urlEndPoint = "users";
  static final UserBloc instance = UserBloc._();

  StreamController<List<UserModel>> _streamController;
  Stream<List<UserModel>> get streamUsersModel => _streamController.stream;
  UserModel userSelected;

  factory UserBloc() => instance;

  UserBloc._() {
    _streamController = StreamController.broadcast();
  }

  Future loadUsers() async {
    try {
      _streamController.sink.add(DataBaseBloc.instance.boxUser.values.toList());
    } catch (e, stackTrace) {
      log(e.toString(),
          name: "UserBloc.loadUserApiData", stackTrace: stackTrace);
      return Future.error(e);
    }
  }

  dispose() {
    _streamController.close();
  }
}
