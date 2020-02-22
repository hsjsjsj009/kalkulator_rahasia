import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/about_me/aboutMe.dart';
import 'package:kalkulator_rahasia/calculator/numberGrid.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

import '../main.dart';

class CalculatorPage extends StatefulWidget{
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage>{
  bool aboutMe = false;

  Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you want to exit an app"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No",
                    style: TextStyle(
                      color: store.state["darkTheme"] ? Colors.white : Colors.black87
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => SystemNavigator.pop(animated: true),
                  child: Text("Yes",
                    style: TextStyle(
                        color: store.state["darkTheme"] ? Colors.white : Colors.black87
                    ),
                  ),
                ),
              ],
            );
          }
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<Map,Map>(
      builder: (context, redux){
        return WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black12,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("Do you want to exit an app"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text("No",
                                    style: TextStyle(
                                      color: redux["darkTheme"] ? Colors.white : Colors.black87
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () => SystemNavigator.pop(animated: true),
                                  child: Text("Yes",
                                    style: TextStyle(
                                        color: redux["darkTheme"] ? Colors.white : Colors.black87
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      );
                    },
                  ),
                  Padding(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3 + 10,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.black38)
                        ),
                        child: Text(aboutMe ? "BACK" : "ABOUT ME",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            aboutMe = !aboutMe;
                          });
                        },
                        color: redux["darkTheme"] ? Colors.white30 : Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/15, 0,0, 0),
                  ),
                  Column(
                    children: <Widget>[
                      Text("Dark Mode",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Switch(
                          value: redux["darkTheme"],
                          onChanged: (bool value) {
                            redux["changeThemeFunc"]();
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            body: aboutMe? AboutMe() : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(redux["calculatorValue"],
                        style: TextStyle(
                            fontSize: 50
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(redux["calculatorResult"].toString(),
                        style: TextStyle(
                            fontSize: 50
                        ),
                      )
                    ],
                  ),
                ),
                NumberGrid(),
              ],
            ),
          ),
        );
      },
      converter: (store) {
          return {
            "darkTheme":store.state["darkTheme"],
            "changeThemeFunc":() => store.dispatch({"action":ReducerActions.CHANGE_THEME}),
            "calculatorValue":store.state["calculatorValue"],
            "calculatorResult":store.state["calculatorResult"]
          };
      },
    );
  }

}