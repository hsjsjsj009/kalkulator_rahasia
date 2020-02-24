import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/loginPage/loginPage.dart';
import 'package:kalkulator_rahasia/reducer/reducer.dart';
import 'package:redux/redux.dart';

final Store<Map> store = Store<Map>(stateReducer,initialState: initialState);

void main() {
  runApp(
      StoreProvider(
        store: store,
        child: App(),
      ));
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return StoreConnector<Map,Map>(
        converter: (store) => {
          "loggedIn":store.state["loggedIn"],
          "darkTheme":store.state["darkTheme"]
        },
        builder: (context, state){
          return MaterialApp(
            theme: state["darkTheme"] ? ThemeData.dark() : ThemeData.light(),
            home: LoginPage(),
          );
        },
      );
  }
}

