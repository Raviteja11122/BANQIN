import 'package:flutter/services.dart';

import '../../core/view_models/text_field_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FormTextField extends StatelessWidget {

  const FormTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSaved,
    this.onChange,
    this.onSubmitted,
    this.icon,
    this.focusNode,
    this.readOnly = false,
    this.onTap,
    this.isNumber,
    this.isDecimal
  }): assert(isNumber == null || isDecimal == null, "Can't specify both decimal and number"),
      super(key: key);

  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool? isNumber;
  final bool? isDecimal;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TextFieldViewModel>.reactive(
      builder: (context, model, _) => TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        focusNode: focusNode,
        maxLines: maxLines,
        inputFormatters: getInputFormatter(isNumber, isDecimal),
        decoration: InputDecoration(
          iconColor: Colors.white,
          filled: true,
          hintText: hintText,
          fillColor: const Color(0xFF3A3A3C),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none
          ),
          prefixIcon: icon != null ? Icon(icon) : null,
          suffixIcon: hintText == "Password" ? IconButton(
            color: const Color(0xFF8E8E93),
            onPressed: model.toggleVisibility,
            icon: model.isHidden ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          ) : null,
        ),
        style: const TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: getKeyboardType(hintText, isNumber, isDecimal),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChange,
        textInputAction: textInputAction,
        onFieldSubmitted: onSubmitted,
        obscureText: hintText == "Password" ? model.isHidden : false,
      ),
      viewModelBuilder: () => TextFieldViewModel()
    );
  }
}

TextInputType getKeyboardType(String hintText, [bool? isNumber, bool? isDecimal]){
  if(isNumber != null && isNumber) {
    return TextInputType.number;
  } else if(isDecimal != null && isDecimal) {
    return const TextInputType.numberWithOptions(
      decimal: true,
      signed: true
    );
  } else if(hintText.contains("Phone Number")) {
    return TextInputType.phone;
  } else if(hintText.contains("Email")) {
    return TextInputType.emailAddress;
  } else {
    return TextInputType.text;
  }
}

List<TextInputFormatter>? getInputFormatter([bool? isNumber, bool? isDecimal]){
  if(isNumber != null && isNumber) {
    return [FilteringTextInputFormatter.digitsOnly];
  } else if(isDecimal != null && isDecimal) {
    return [FilteringTextInputFormatter.allow(RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))];
  } else {
    return null;
  }
}
