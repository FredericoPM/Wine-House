import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class FormTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  String errorText;
  void Function() onFocusExit;
  var keyboardType;
  int maxLength;
  FormTextField({this.controller, this.labelText, this.errorText, this.keyboardType = TextInputType.text, this.onFocusExit, this.maxLength});
  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  bool _focus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FocusScope(
          child: Focus(
              onFocusChange: (focus)  {
                setState(() { _focus = focus; });
                if(!focus && widget.onFocusExit != null){
                  widget.onFocusExit();
                }
              },
              child:TextFormField(
                maxLengthEnforced: true,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                enabled: true,
                controller: widget.controller,
                validator: widget.errorText == "" ? null : (s) {
                  if (s.isEmpty)
                    return widget.errorText;
                  else
                    return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16,8,16,8),
                  labelText: widget.labelText,
                  labelStyle: _focus || widget.controller.text != ""? TextStyle(fontSize: 22, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600):null,
                  // labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  errorStyle: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  suffixIcon: _focus ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey,),
                    onPressed: () {
                      setState(() { widget.controller.text = ""; });
                    },
                  ) : null,
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey[200],
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
          )
      ),
    );
  }
}
