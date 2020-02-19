import 'package:flutter/material.dart';
import 'package:kalkulator_rahasia/loginPage/passwordInput.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: PasswordInput(textEditingController: textEditingController,formKey: _formKey,)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Loading.."),));
                    }
                  },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }

}