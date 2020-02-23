import 'package:flutter/animation.dart';
import 'package:kalkulator_rahasia/calculator/calculatorPage.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';
import 'package:kalkulator_rahasia/reducer/calculatorFunctions/calculatorFunctions.dart';

final Map initialState ={
  "darkTheme":false,
  "loggedIn":false,
  "calculatorValue":"0",
  "calculatorResult":0,
  "calculatorHistory":[],
  "alreadyCalculated":false,
};



Map stateReducer(Map previousState, actions){
  switch(actions["action"]){
    case ReducerActions.DELETE_VALUE_CALCULATOR:
      if(previousState["alreadyCalculated"]){
        scrollToInitialHistory();
        return{
          ...previousState,
          "calculatorHistory":[previousState["calculatorValue"]+"="+previousState["calculatorResult"].toString()] + previousState["calculatorHistory"],
          "alreadyCalculated":false,
          "calculatorValue":deleteValueOnCalculator(previousState["calculatorResult"].toString()),
          "calculatorResult":0
        };
      }
      return {
        ...previousState,
        "calculatorValue":deleteValueOnCalculator(previousState["calculatorValue"])
      };
    case ReducerActions.INPUT_CALCULATOR:
      if(previousState["alreadyCalculated"]){
        scrollToInitialHistory();
        if(double.tryParse(actions["data"].toString()) == null){
          return {
            ...previousState,
            "calculatorHistory":[previousState["calculatorValue"]+"="+previousState["calculatorResult"].toString()] + previousState["calculatorHistory"],
            "calculatorResult":0,
            "alreadyCalculated":false,
            "calculatorValue":displayCalculator(previousState["calculatorResult"].toString(), actions["data"].toString())
          };
        }else if(double.tryParse(actions["data"].toString()) != null){
          return {
            ...previousState,
            "calculatorHistory":[previousState["calculatorValue"]+"="+previousState["calculatorResult"].toString()] + previousState["calculatorHistory"],
            "calculatorResult":0,
            "alreadyCalculated":false,
            "calculatorValue": actions["data"].toString()
          };
        }
      }
      return {
        ...previousState,
        "calculatorValue":displayCalculator(previousState["calculatorValue"], actions["data"].toString())
      };
    case ReducerActions.CLEAR_CALCULATOR:
      if(previousState["alreadyCalculated"]){
        scrollToInitialHistory();
        return {
          ...previousState,
          "calculatorHistory":[previousState["calculatorValue"]+"="+previousState["calculatorResult"].toString()] + previousState["calculatorHistory"],
          "calculatorValue":"0",
          "calculatorResult":"0",
          "alreadyCalculated":false
        };
      }
      return {
        ...previousState,
        "calculatorValue":"0",
        "calculatorResult":"0",
        "alreadyCalculated":false
      };
    case ReducerActions.PROCESS_CALCULATOR:
      return {
        ...previousState,
        "calculatorResult":calculateCalculator(previousState["calculatorValue"]),
        "alreadyCalculated":true,
      };
    case ReducerActions.CHANGE_THEME:
      return {
        ...previousState,
        "darkTheme":!previousState["darkTheme"],
      };
    case ReducerActions.LOGIN_SUCCESS:
      return {
        ...previousState,
        "loggedIn":true,
      };
    default:
      return previousState;
  }
}