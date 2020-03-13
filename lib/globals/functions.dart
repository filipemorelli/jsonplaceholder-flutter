import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jsonplaceholder/globals/constans.dart';

showToast({
  @required GlobalKey<ScaffoldState> scaffoldKey,
  @required String text,
}) {
  if (scaffoldKey == null) return;
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(seconds: 5),
  ));
}

doGetAPIRequest({
  @required String endPoint,
  Map<String, String> headers,
}) async {
  return get(urlAPI + endPoint, headers: headers);
}
