import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/calculator/calculatorPage.dart';
import 'package:kalkulator_rahasia/loginPage/passwordInput.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {

    return StoreConnector<Map,Map>(
      builder: (context, state){
        return !state["loggedIn"] ? Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StoreConnector<Map,VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ReducerActions.CHANGE_THEME);
                  },
                  builder: (context,callback){
                    return Switch(
                      value: state["darkTheme"],
                      onChanged: (bool value){
                        callback();
                      }
                    );
                  },
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
                    child: StoreConnector<Map,VoidCallback>(
                      converter: (store){
                        return () => store.dispatch(ReducerActions.LOGIN_SUCCESS);
                      },
                      builder: (context, callback){
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.black38)
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              callback();
                            }
                          },
                          color: Colors.white,
                          child: Text("Login",
                            style: TextStyle(
                                fontSize: 20
                            ),),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ) : CalculatorPage();
      },
      converter: (store) => store.state,

    );
  }



}