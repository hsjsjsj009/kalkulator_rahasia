import 'package:flutter/cupertino.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';
import 'package:redux/redux.dart';

final Map initialState ={
  "darkTheme":false,
  "loggedIn":false,
};

Map stateReducer(Map previousState, actions){
  switch(actions){
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