import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

class NumberGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var fontStyle = TextStyle(
        fontSize: 30
    );
    var buttonHeight = MediaQuery.of(context).size.height/9;
    var buttonWidth = MediaQuery.of(context).size.width/5;


    return StoreConnector<Map,Map>(

      builder: (context,reducer){
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    onPressed: () {
                      reducer["clearCalculatorFunc"]();
                    },
                    child: Text(
                      "C",
                      style: fontStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4*buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      "DEL",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["deleteCalculatorValueFunc"]();
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                    children: this.generateNumberButton(reducer, buttonHeight, buttonWidth,fontStyle)
                ),
                SizedBox(
                  width: buttonWidth,
                  height: 3*buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      "+",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["changeValueFunc"]("+");
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      "0",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["changeValueFunc"]("0");
                    },
                  ),
                ),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      "00",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["changeValueFunc"]("00");
                    },
                  ),
                ),
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      ".",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["changeValueFunc"](".");
                    },
                  ),
                ),
                SizedBox(
                  width: 2*buttonWidth,
                  height: buttonHeight,
                  child: RaisedButton(
                    child: Text(
                      "=",
                      style: fontStyle,
                    ),
                    onPressed: () {
                      reducer["processCalculatorFunc"]();
                    },
                  ),
                )
              ],
            )
          ],
        );
      },
      converter: (store) {
        return {
          "changeValueFunc":(value) => store.dispatch(inputCalculator(value)),
          "clearCalculatorFunc":() => store.dispatch(clearCalculator()),
          "processCalculatorFunc":() => store.dispatch(processCalculator()),
          "deleteCalculatorValueFunc":() => store.dispatch(deleteValueCalculator())
        };
      },
    );
  }
  List<Widget> generateNumberButton(reducer, buttonHeight,buttonWidth, fontStyle){
    var calculatorSymbol = ["/","X","-"];
    var numberButton = <Widget>[];
    int counter = 9;
    for(int i=0;i<3;i++){
      var tempButtonList = <Widget>[];
      for(int j=3;j>0;j--){
        String value = counter.toString();
        if(j==3){
          tempButtonList.add(
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: RaisedButton(
                  child: Text(
                    calculatorSymbol[i].toString(),
                    style: fontStyle,
                  ),
                  onPressed: () {
                      reducer["changeValueFunc"](calculatorSymbol[i].compareTo("X") == 0 ? "*":calculatorSymbol[i]);
                  },
                ),
              )
          );
        }
        tempButtonList.insert(0,
            SizedBox(
              width: buttonWidth,
              height: buttonHeight,
              child: RaisedButton(
                child: Text(
                  counter.toString(),
                  style: fontStyle,
                ),
                onPressed: () {
                  reducer["changeValueFunc"](value);
                },
              ),
            )
        );
        counter--;
      }
      numberButton.add(
          Row(
            children: tempButtonList,
          )
      );
    }
    return numberButton;
  }
}

