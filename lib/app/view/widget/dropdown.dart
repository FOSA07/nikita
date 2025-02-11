import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class DropDownField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final List<Map<String, dynamic>> dropDownValueModel;
  final List dropDownValues;
  final ValueChanged? onChanged;
  final bool isLoading;
  const DropDownField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.dropDownValueModel,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.onChanged,
      this.isLoading = false,
      List<dynamic>? dropDownValues})
      : dropDownValues = dropDownValues ?? const [];

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      clearOption: true,
      textStyle: Theme.of(context).textTheme.labelMedium,
      enableSearch: true,
      clearIconProperty: IconProperty(
        color: Colors.grey,
      ),
      searchTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 8,
      ),

      dropDownIconProperty: IconProperty(
        color: dropDownValueModel.isEmpty ? Colors.grey : null,
        // icon: Icons.auto_awesome
        // icon: Icons.hourglass_bottom
        // icon: Icons.refresh
        icon: isLoading ? Icons.more_horiz : Icons.arrow_drop_down,
      ),
      searchDecoration: InputDecoration(
        hintText: "Search...",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        // contentPadding: const EdgeInsets.only(left: 20)
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required field";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      // dropDownItemCount: 3,
      listTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
      textFieldDecoration: InputDecoration(
        labelText: labelText,
        hintText: '',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.blue)),
      ),
      // dropDownList: dropDownValueModel,
      dropDownList: [
        ...List.generate(
            dropDownValues.isEmpty
                ? dropDownValueModel.length
                : dropDownValues.length,
            (index) => DropDownValueModel(
                name: dropDownValues.isEmpty
                    ? dropDownValueModel[index]["name"]!
                    : dropDownValues[index],
                value: dropDownValues.isEmpty
                    ? dropDownValueModel[index]["map"]!
                    : index))
      ],
    );
  }
}
