import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppActionButton extends StatelessWidget {
  final String? text;
  final String? image;
  final VoidCallback onPressed;
  final bool isLoading;
  final EdgeInsets? padding;
  final bool fullWidth;
  final bool isPrimary;
  final double height;
  final double? width;
  final Color? textColor;
  final Color? buttonColor;
  final String? path;
  const AppActionButton({
    super.key,
    this.text,
    this.image,
    required this.onPressed,
    required this.isLoading,
    this.padding,
    this.fullWidth = true,
    this.isPrimary = true,
    this.height = 56,
    this.width,
    this.textColor,
    this.buttonColor,
    this.path
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height == 56 ? 15.0 : 8),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: fullWidth ? double.infinity : null,
          padding: padding ?? EdgeInsets.symmetric(horizontal: height == 56 ? 15 : 9, vertical: height == 56 ? 15 : 7),
          textColor: textColor ?? (isPrimary ? Colors.white : Color(0xFFA44B6F)),
          color: buttonColor ?? (isPrimary ? Color(0xFFA44B6F) : Color(0xFFFFE2E8)),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Center(
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(text != null) Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: textColor ?? (isPrimary ? Colors.white : Colors.black),
                        fontWeight: FontWeight.bold,
                        fontSize: height != 56 ? 12 : null
                      ),
                    ),
                    if (image != null) SvgPicture.asset(image!)
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
