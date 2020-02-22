import 'package:kalkulator_rahasia/reducer/actions.dart';
import 'package:kalkulator_rahasia/reducer/calculatorFunctions/calculatorFunctions.dart';

final Map initialState ={
  "darkTheme":false,
  "loggedIn":false,
  "calculatorValue":"0",
  "calculatorResult":0,
  "alreadyCalculated":false,
};

Map stateReducer(Map previousState, actions){
  switch(actions["action"]){
    case ReducerActions.DELETE_VALUE_CALCULATOR:
      if(previousState["alreadyCalculated"]){
        return{
          ...previousState,
          "alreadyCalculated":false,
          "calcualtorValue":deleteValueOnCalculator(previousState["calculatorResult"])
        };
      }
      return {
        ...previousState,
        "calculatorValue":deleteValueOnCalculator(previousState["calculatorValue"])
      };
    case ReducerActions.INPUT_CALCULATOR:
      if(previousState["alreadyCalculated"] && double.tryParse(actions["data"].toString()) == null){
        return {
          ...previousState,
          "calculatorResult":0,
          "alreadyCalculated":false,
          "calculatorValue":displayCalculator(previousState["calculatorResult"].toString(), actions["data"].toString())
        };
      }else if(previousState["alreadyCalculated"] && double.tryParse(actions["data"].toString()) != null){
        return {
          ...previousState,
          "calculatorResult":0,
          "alreadyCalculated":false,
          "calculatorValue": actions["data"].toString()
        };
      }
      return {
        ...previousState,
        "calculatorValue":displayCalculator(previousState["calculatorValue"], actions["data"].toString())
      };
    case ReducerActions.CLEAR_CALCULATOR:
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