import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/calculator/calculatorPage.dart';
import 'package:kalkulator_rahasia/loginPage/loginPage.dart';
import 'package:kalkulator_rahasia/reducer/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<Map> store = Store<Map>(stateReducer,initialState: initialState);
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
            darkTheme: state["darkTheme"] ? ThemeData.dark() : ThemeData.light(),
            home: state["loggedIn"] ? CalculatorPage() : LoginPage(),
          );
        },
      );
  }
}

