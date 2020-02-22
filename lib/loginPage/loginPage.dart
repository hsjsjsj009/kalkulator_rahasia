import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/calculator/calculatorPage.dart';
import 'package:kalkulator_rahasia/loginPage/passwordInput.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {

    return StoreConnector<Map,Map>(
      builder: (context, redux){
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Image(
                      height: MediaQuery.of(context).size.height/10,
                      image: AssetImage("assets/calculator.png"),
                    ),
                  ),
                  Text("Kalkulator Rahasia",
                    style: TextStyle(
                      fontSize: 36,
                    ),),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: PasswordInput(textEditingController: textEditingController,formKey: _formKey,)
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child:
                    SizedBox(
                        height: 45,
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black38)
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              FocusScope.of(context).requestFocus(new FocusNode());
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => CalculatorPage())
                              );
                              redux["logInFunc"]();
                            }
                          },
                          color: Colors.white,
                          child: Text("Login",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      converter: (store) => {
        "logInFunc":() => store.dispatch({"action":ReducerActions.LOGIN_SUCCESS}),
      },

    );
  }



}