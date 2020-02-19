import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget{
  final TextEditingController textEditingController;
  final formKey;

  const PasswordInput({Key key, this.textEditingController, this.formKey}) : assert(textEditingController != null),assert(formKey != null),super(key: key);
  @override
  State<StatefulWidget> createState() => _PasswordInputState();

}

class _PasswordInputState extends State<PasswordInput>{
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      key: widget.formKey,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Icon(
            showPassword?Icons.visibility : Icons.visibility_off,
          ),
        )
      ),
      obscureText: !showPassword,
      validator: (String value){
        if(value.isEmpty){
          return "Please enter your password";
        }
        if(value != "2020"){
          return "Wrong password";
        }
        return null;
      },
    );
  }

}