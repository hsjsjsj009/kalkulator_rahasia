import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

class NumberGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var fontStyle = TextStyle(
        fontSize: 30,
    );
    var buttonHeight = MediaQuery.of(context).size.height/11;
    var buttonWidth = MediaQuery.of(context).size.width/5;

    return StoreConnector<Map,Map>(

      builder: (context,reducer){
        var numberColor = reducer["darkTheme"] ? Colors.black : Colors.white70;
        var funcColor = reducer["darkTheme"] ? Colors.white10 : Colors.white30;
        var opColor = reducer["darkTheme"] ? Colors.white30 : Colors.white12;

        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      onPressed: () {
                        reducer["clearCalculatorFunc"]();
                      },
                      color:funcColor,
                      child: Text(
                        "C",
                        style: fontStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      color: funcColor,
                      child: Text(
                        "DEL",
                        style: fontStyle,
                      ),
                      onPressed: () {
                        reducer["deleteCalculatorValueFunc"]();
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                    children: this.generateNumberButton(reducer, buttonHeight, buttonWidth,fontStyle,numberColor,opColor)
                ),
                SizedBox(
                  width: buttonWidth,
                  height: 3*buttonHeight,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                    ),
                    color: opColor,
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
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      color: numberColor,
                      child: Text(
                        "0",
                        style: fontStyle,
                      ),
                      onPressed: () {
                        reducer["changeValueFunc"]("0");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      color: numberColor,
                      child: Text(
                        "00",
                        style: fontStyle,
                      ),
                      onPressed: () {
                        reducer["changeValueFunc"]("00");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      color: opColor,
                      child: Text(
                        ".",
                        style: fontStyle,
                      ),
                      onPressed: () {
                        reducer["changeValueFunc"](".");
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: buttonHeight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                      ),
                      color: funcColor,
                      child: Text(
                        "=",
                        style: fontStyle,
                      ),
                      onPressed: () {
                        reducer["processCalculatorFunc"]();
                      },
                    ),
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
          "deleteCalculatorValueFunc":() => store.dispatch(deleteValueCalculator()),
          "darkTheme":store.state["darkTheme"]
        };
      },
    );
  }
  List<Widget> generateNumberButton(reducer, buttonHeight,buttonWidth, fontStyle, numberColor, opColor){
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
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                  ),
                  color: opColor,
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
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: reducer["darkTheme"] ? Colors.white : Colors.black)
                ),
                color: numberColor,
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

