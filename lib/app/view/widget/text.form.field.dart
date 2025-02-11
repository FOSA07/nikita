import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final String? prefixText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool enabled;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.prefixText,
    this.hintText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines,
    this.enabled = true,
    this.readOnly = false,
    this.textInputAction,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: 1,
      enabled: enabled,
      textInputAction: textInputAction,
      focusNode: focusNode,
      readOnly: readOnly,
      onTapOutside: (e) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        enabled: enabled,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          minWidth: 35,
          minHeight: 34,
        ),
        filled: true,
        fillColor: Colors.white,
        prefix: prefixText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  prefixText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              )
            : null,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        isDense: true,
        // contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }
}
