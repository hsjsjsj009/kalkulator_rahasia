import 'package:expressions/expressions.dart';
import 'package:flutter/cupertino.dart';

String displayCalculator(String valueBefore,String input){
      if(double.tryParse(valueBefore) == null && (input.compareTo(".") != 0 && input.compareTo("-") != 0) && double.tryParse(input) == null ){
        return valueBefore;
      }
      if(valueBefore.compareTo("0") == 0 && input.compareTo("00") == 0){
        return "0";
      }
      if(valueBefore.compareTo("0") == 0 && input.compareTo(".") != 0 && double.tryParse(input) != null){
        return input;
      }
      if(valueBefore.compareTo("0") == 0 && input.compareTo(".") != 0 && double.tryParse(input) == null){
        return input.compareTo("-") == 0 ? "-" : "0";
      }
      if(input.compareTo("-") == 0){
        if('-'.allMatches(valueBefore).length == 3){
          return valueBefore;
        }else if ('-'.allMatches(valueBefore).length == 1 && double.tryParse(valueBefore) != null){
          return valueBefore + input;
        }else if('-'.allMatches(valueBefore).length == 1 && valueBefore.endsWith("-")){
          return valueBefore;
        }
      }
      if(input.compareTo(".") == 0){
        var numberArray = valueBefore.split(RegExp(r'[*|+|/|-]'));
        debugPrint(numberArray.toString());
        switch(numberArray.length){
          case 1:
            if(numberArray[0].contains(".")){
              return valueBefore;
            }
            break;
          case 2:
            if(numberArray[1].contains(".")){
              return valueBefore;
            }
            break;
        }
      }
      if(double.tryParse(input) == null && valueBefore.endsWith(".")){
        return valueBefore;
      }
      if(valueBefore.length > 11){
        return valueBefore;
      }
      return valueBefore+input;
}

final evaluator = const ExpressionEvaluator();

dynamic calculateCalculator(String value){
  Expression expression = Expression.parse(value);
  var result = evaluator.eval(expression, {});
  if(result.toString().contains(".")){
    return (result as double).toStringAsFixed(2);
  }
  return result;
}

String deleteValueOnCalculator(String valueBefore){
  if(valueBefore.compareTo("0") == 0){
    return valueBefore;
  }
  if(valueBefore.length == 1){
    return "0";
  }
  return valueBefore.substring(0,valueBefore.length-1);
}