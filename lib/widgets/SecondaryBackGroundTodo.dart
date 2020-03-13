import 'package:flutter/material.dart';
import 'package:jsonplaceholder/globals/styles.dart';

class DismissibleBackgroundTodo extends StatelessWidget {
  const DismissibleBackgroundTodo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.only(right: dismissibleInnerSpace),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: dismissibleInnerSpace),
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
    );
  }
}
