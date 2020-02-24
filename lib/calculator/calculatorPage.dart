import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/about_me/aboutMe.dart';
import 'package:kalkulator_rahasia/calculator/numberGrid.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

import '../main.dart';

final ScrollController calculatorScrollController = ScrollController();

void scrollToInitialHistory(){
  calculatorScrollController.animateTo(0.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
}

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
        List<Widget> history = [];
        for(int i=0;i<((redux["calculatorHistory"] as List).length);i++){
          history.insert(0, Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 6),
            child: Text(
              redux["calculatorHistory"][i],
              style: TextStyle(
                  fontSize: 28
              ),
              textAlign: TextAlign.right,
            ),
          ));
        }
        
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
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: SingleChildScrollView(
                      controller: calculatorScrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: history,
                      ),
                      reverse: true,
                    ),
                  ),
                ),
                Divider(color: redux["darkTheme"] ? Colors.white70 : Colors.black12,thickness: 3,),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(redux["calculatorValue"],
                          style: TextStyle(
                              fontSize: 48
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(redux["calculatorResult"].toString(),
                          style: TextStyle(
                              fontSize: 48
                          ),
                        )
                      ],
                    ),
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
            "calculatorResult":store.state["calculatorResult"],
            "calculatorHistory":store.state["calculatorHistory"],
            "alreadyCalculated":store.state["alreadyCalculated"]
          };
      },
    );
  }

}