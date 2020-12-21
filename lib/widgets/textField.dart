import 'package:flutter/material.dart';
class TextFild extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  String errorText;
  void Function(String text) onChanged;
  var icon;
  TextFild({this.controller, this.hintText, this.errorText, this.onChanged, this.icon});
  @override
  _TextFildState createState() => _TextFildState(this.controller, this.hintText, this.errorText, this.onChanged, this.icon);
}

class _TextFildState extends State<TextFild> {
  TextEditingController controller = TextEditingController();
  String hintText;
  String errorText;
  void Function(String text) onChanged;
  var icon;
  bool _focus = false;
  _TextFildState(this.controller, this.hintText, this.errorText, this.onChanged, this.icon);
  @override
  Widget build(BuildContext context) {
    return FocusScope(
        child: Focus(
            onFocusChange: (focus) => setState(() { _focus = focus; }),
            child:TextFormField(
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
