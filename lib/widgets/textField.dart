import 'package:flutter/material.dart';
import '../controls/pesquisaAproximada.dart';
class TextFild extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  String errorText;
  void Function(String text) onChanged;
  void Function() onFocusExit;
  var keyboardType;
  TextFild({this.controller, this.hintText, this.errorText, this.onChanged, this.keyboardType = TextInputType.text, this.onFocusExit});
  @override
  _TextFildState createState() => _TextFildState();
}

class _TextFildState extends State<TextFild> {

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
                  labelText: widget.hintText,
                  // labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  errorStyle: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                  suffixIcon: _focus ? IconButton(
                    icon: Icon(Icons.clear, color: Theme.of(context).primaryColor,),
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
