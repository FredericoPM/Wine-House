import 'package:flutter/material.dart';
class TextFild extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  String errorText;
  void Function(String text) onChanged;
  var icon;
  var keyboardType;
  TextFild({this.controller, this.hintText, this.errorText, this.onChanged, this.icon, this.keyboardType = TextInputType.text});
  @override
  _TextFildState createState() => _TextFildState(this.controller, this.hintText, this.errorText, this.onChanged, this.icon, this.keyboardType);
}

class _TextFildState extends State<TextFild> {

  var icon;
  String hintText;
  String errorText;
  var keyboardType;
  bool _focus = false;
  void Function(String text) onChanged;
  TextEditingController controller = TextEditingController();

  _TextFildState(this.controller, this.hintText, this.errorText, this.onChanged, this.icon, this.keyboardType);
  @override
  Widget build(BuildContext context) {
    return FocusScope(
        child: Focus(
            onFocusChange: (focus) => setState(() { _focus = focus; }),
            child:TextFormField(
              keyboardType: keyboardType,
              enabled: true,
              controller: controller,
              validator: (s) {
                if (s.isEmpty)
                  return errorText;
                else
                  return null;
              },
              onChanged: (text) => {
                if(onChanged != null)
                  onChanged(text)
              },
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: icon,
                errorStyle: TextStyle(
                  color: Color(0xFF942641),
                ),
                suffixIcon: _focus ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[700]),
                  onPressed: () {
                    setState(() { controller.text = ""; });
                    if(onChanged != null)
                      onChanged(controller.text);
                  },
                ) : null,
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey[200],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            )
        )
    );
  }
}
