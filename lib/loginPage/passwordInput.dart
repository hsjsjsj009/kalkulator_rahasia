import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget{
  final TextEditingController textEditingController;
  final formKey;

  const PasswordInput({Key key, this.textEditingController, this.formKey, }) : assert(textEditingController != null),assert(formKey != null),super(key: key);
  @override
  State<StatefulWidget> createState() => _PasswordInputState();

}

class _PasswordInputState extends State<PasswordInput>{
  bool showPassword = false;
  bool success = true;
  bool focused = false;

  FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener((){
      setState(() {
        focused = true;
      });
    });
  }

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
                color: success ? focused ? Colors.blue : Colors.black38 : Colors.red,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red,width: 4)
            )
        ),
        obscureText: !showPassword,
        validator: (String value){
          if(value.isEmpty){
            setState(() {
              success = false;
            });
            return "Please enter your password";
          }
          if(value != "2020"){
            setState(() {
              success = false;
            });
            return "Wrong password";
          }
          setState(() {
            success = true;
          });
          return null;
        },
        focusNode: _focusNode,
      );
  }

}