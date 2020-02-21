import 'package:expressions/expressions.dart';

String displayCalculator(String valueBefore,String input){
      if(double.tryParse(valueBefore) == null && double.tryParse(input) == null){
        return valueBefore;
      }
      if(valueBefore.compareTo("0") == 0 && input.compareTo("00") == 0){
        return "0";
      }
      if(valueBefore.compareTo("0") == 0 && input.compareTo(".") != 0 && double.tryParse(input) != null){
        return input;
      }
      if(valueBefore.length > 10){
        return valueBefore;
      }
      return valueBefore+input;
}

final evaluator = const ExpressionEvaluator();

dynamic calculateCalculator(String value){
  Expression expression = Expression.parse(value);
  return evaluator.eval(expression, {});
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