import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/bloc/TodoBloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      TodoBloc.instance.loadTodos().catchError((e) {
        showToast(scaffoldKey: _scaffoldKey, text: e.toString());
      });
    });
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
        child: StreamBuilder<List<TodoModel>>(
          stream: TodoBloc.instance.streamTodosModel,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                TodoModel todo = snapshot.data[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: IconButton(
                    icon: Icon(todo.completed
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () async {
                      todo.completed = !todo.completed;
                      await todo.save();
                    },
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await todo.delete();
                      }),
                );
              },
            );
          },
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: DrawerNavigation(),
    );
  }
}
