import 'package:flutter/material.dart';
import '../../controllers/pesquisaAproximada.dart';
class FormTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  String errorText;
  void Function(String text) onChanged;
  void Function() onFocusExit;
  var keyboardType;
  FormTextField({this.controller, this.labelText, this.errorText, this.onChanged, this.keyboardType = TextInputType.text, this.onFocusExit});
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
                maxLines: null,
                keyboardType: widget.keyboardType,
                enabled: true,
                controller: widget.controller,
                validator: widget.errorText == "" ? null : (s) {
                  if (s.isEmpty)
                    return widget.errorText;
                  else
                    return null;
                },
                onChanged: (text) => {
                  if(widget.onChanged != null)
                    widget.onChanged(text)
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16,8,16,8),
                  labelText: widget.labelText,
                  labelStyle: _focus || widget.controller.text != ""? TextStyle(fontSize: 22, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600):null,
                  // labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  errorStyle: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                  suffixIcon: _focus ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey,),
                    onPressed: () {
                      setState(() { widget.controller.text = ""; });
                      if(widget.onChanged != null)
                        widget.onChanged(widget.controller.text);
                    },
                  ) : null,
                  filled: true,
                  fillColor: Colors.grey[200],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.grey[200],
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.5),
                    borderSide: BorderSide(
                      width: 2,
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
