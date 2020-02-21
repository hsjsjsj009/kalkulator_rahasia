import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/loginPage/loginPage.dart';
import 'package:kalkulator_rahasia/reducer/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<Map> store = Store<Map>(stateReducer,initialState: initialState);
  runApp(
      StoreProvider(
        store: store,
        child: MaterialApp(
          home: App(),
        ),
      ));
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return LoginPage();
  }
}

