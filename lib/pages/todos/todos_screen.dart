import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jsonplaceholder/bloc/Database.dart';
import 'package:jsonplaceholder/bloc/UserBloc.dart';
import 'package:jsonplaceholder/globals/functions.dart';
import 'package:jsonplaceholder/models/TodoModel.dart';
import 'package:jsonplaceholder/widgets/DrawerNavigation.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Todos"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Box<TodoModel>>(
          valueListenable: DataBaseBloc.instance.boxTodo.listenable(),
          // stream: TodoBloc.instance.streamTodosModel,
          builder: (context, box, widget) {
            var todos = box.values
                .where((t) => t.userId == UserBloc.instance.userSelected.id)
                .toList();
            if (todos.length == 0) {
              return Center(child: CircularProgressIndicator());
            }
            return Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (ctx, index) {
                  TodoModel todo = box.getAt(index);
                  return Dismissible(
                    key: Key(todo.id.toString()),
                    background: SizedBox(),
                    direction: DismissDirection.endToStart,
                    secondaryBackground: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "Excluir Todo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    onDismissed: (DismissDirection dismissDirection) {
                      todo.delete();
                      showToast(
                          scaffoldKey: _scaffoldKey,
                          text: todo.title + " removido.");
                    },
                    child: ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      leading: IconButton(
                        icon: Icon(todo.completed
                            ? Icons.check_box
                            : Icons.check_box_outline_blank),
                        onPressed: () async {
                          todo.completed = !todo.completed;
                          await todo.save(scaffoldKey: _scaffoldKey);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await todo.delete(scaffoldKey: _scaffoldKey);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: DrawerNavigation(),
    );
  }
}
