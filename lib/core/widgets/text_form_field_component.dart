import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volus_app/imports.dart';

class TextFormFieldComponent extends StatefulWidget {
  const TextFormFieldComponent({
    super.key,
    this.hint,
    this.controller,
    this.validator,
    this.formatters,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
  });

  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLength;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  String? errorText;
  final _key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _key,
      inputFormatters: widget.formatters,
      textCapitalization: widget.textCapitalization,
      validator: (v) {
        errorText = widget.validator?.call(v);
        return errorText;
      },
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscuringCharacter: '•',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: TextAlign.start,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hint,
        counterText: '',
        alignLabelWithHint: true,
        labelText: widget.hint,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        hoverColor: AppColors.pinkColor,
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        contentPadding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
        focusColor: AppColors.pinkColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.pinkColor),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.pinkColor),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
