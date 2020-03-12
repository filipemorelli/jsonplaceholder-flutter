import 'dart:convert';
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:jsonplaceholder/globals/functions.dart';
import 'package:jsonplaceholder/models/AddressModel.dart';
import 'package:jsonplaceholder/models/AlbumModel.dart';
import 'package:jsonplaceholder/models/CommentModel.dart';
import 'package:jsonplaceholder/models/CompanyModel.dart';
import 'package:jsonplaceholder/models/GeoModel.dart';
import 'package:jsonplaceholder/models/PhotoModel.dart';
import 'package:jsonplaceholder/models/PostModel.dart';
import 'package:jsonplaceholder/models/TodoModel.dart';
import 'package:jsonplaceholder/models/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DataBaseBloc {
  static String _nameDb = "hive";

  static final DataBaseBloc instance = DataBaseBloc._();

  factory DataBaseBloc() => instance;

  Box<UserModel> boxUser;
  Box<TodoModel> boxTodo;

  DataBaseBloc._();

  loadDataBase() async {
    final dir = await getApplicationDocumentsDirectory();
    final hiveFolder = join(dir.path, _nameDb);
    Hive.init(hiveFolder);
    try {
      await loadHiveBoxes();
      if (isDataLoaded()) {
        await downloadDatabase();
      }
    } on HiveError catch (e, stackTrace) {
      log(e.toString(),
          name: "DataBaseBloc.loadDataBase", stackTrace: stackTrace);
    }
  }

  Future downloadDatabase() async {
    await loadUsers();
    await loadTodos();
  }

  bool isDataLoaded() => boxUser.values.length == 0;

  Future loadHiveBoxes() async {
    if (!Hive.isBoxOpen(UserModel.table)) {
      loadHiveRegisters();
      boxUser = await Hive.openBox<UserModel>(UserModel.table);
      boxTodo = await Hive.openBox<TodoModel>(TodoModel.table);
    } else {
      boxUser = Hive.box<UserModel>(UserModel.table);
      boxTodo = Hive.box<TodoModel>(TodoModel.table);
    }
  }

  void loadHiveRegisters() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AlbumModelAdapter());
    Hive.registerAdapter(PhotoModelAdapter());
    Hive.registerAdapter(CommentModelAdapter());
    Hive.registerAdapter(PostModelAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    Hive.registerAdapter(GeoModelAdapter());
    Hive.registerAdapter(CompanyModelAdapter());
  }

  loadUsers() async {
    Response response = await doGetAPIRequest(endPoint: UserModel.table);
    List<dynamic> result = jsonDecode(response.body);
    List<UserModel> users =
        result.map((userRaw) => UserModel.fromJson(userRaw)).toList();
    boxUser.addAll(users);
  }

  loadTodos() async {
    Response response = await doGetAPIRequest(endPoint: TodoModel.table);
    List<dynamic> result = jsonDecode(response.body);
    List<TodoModel> todos =
        result.map((userRaw) => TodoModel.fromJson(userRaw)).toList();
    boxTodo.addAll(todos);
  }

  deleteAll() {
    Hive.deleteFromDisk();
  }
}
