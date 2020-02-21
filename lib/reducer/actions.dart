enum ReducerActions{
  CHANGE_THEME,
  LOGIN_SUCCESS,
  INPUT_CALCULATOR,
  PROCESS_CALCULATOR,
  CLEAR_CALCULATOR,
  DELETE_VALUE_CALCULATOR
}

Map changeTheme(){
  return {"action":ReducerActions.CHANGE_THEME};
}

Map loggedIn(){
  return {"action":ReducerActions.LOGIN_SUCCESS};
}

Map inputCalculator(value){
  return {"action":ReducerActions.INPUT_CALCULATOR,"data":value};
}

Map processCalculator(){
  return {"action":ReducerActions.PROCESS_CALCULATOR};
}

Map clearCalculator(){
  return {"action":ReducerActions.CLEAR_CALCULATOR};
}

Map deleteValueCalculator(){
  return {"action":ReducerActions.DELETE_VALUE_CALCULATOR};
}