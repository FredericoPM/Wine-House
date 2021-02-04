import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
class AutoCompleteField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  List<dynamic> Function(String text) suggestions;
  String errorText;
  AutoCompleteField({this.controller, this.suggestions, this.errorText});
  @override
  _AutoCompleteFieldState createState() => _AutoCompleteFieldState();
}

class _AutoCompleteFieldState extends State<AutoCompleteField> {
  bool _focus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Focus(
        onFocusChange: (focus)  {
          setState(() { _focus = focus;});
        },
        child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16,8,16,8),
              labelText: "Pais",
              labelStyle: _focus ||widget.controller.text != "" ? TextStyle(fontSize: 22, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600):null,
              // labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
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
            ),
          ),          
          suggestionsCallback: (pattern) {
            return widget.suggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (suggestion) {
            this.widget.controller.text = suggestion;
          },
          validator: widget.errorText == "" 
          ? null 
          : (value) {
            if (value.isEmpty) {
              return widget.errorText;
            }
          },
        ),
      ),
    );
  }
}