import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:jsonplaceholder/globals/functions.dart';
import 'package:jsonplaceholder/models/UserModel.dart';

class UserBloc {
  StreamController<List<UserModel>> _streamController;
  String _urlEndPoint = "users";

  Stream<List<UserModel>> get streamUsersModel => _streamController.stream;

  static final UserBloc instance = UserBloc._();

  factory UserBloc() => instance;

  UserBloc._() {
    _streamController = StreamController.broadcast();
    loadUserApiData();
  }

  Future loadUserApiData() async {
    try {
      Response response = await doGetAPIRequest(endPoint: this._urlEndPoint);
      List<dynamic> result = jsonDecode(response.body);
      print(result);
      print(result.runtimeType.toString());
      List<UserModel> users =
          result.map((userRaw) => UserModel.fromJson(userRaw)).toList();
      _streamController.sink.add(users);
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
