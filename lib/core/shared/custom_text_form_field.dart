import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:online_exam_app/core/utils/app_colors.dart';
import 'package:online_exam_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  // Basic properties
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  // Customizable text properties
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;

  // Customizable styles
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;

  // Icons
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;

  // Border customization
  final double borderRadius;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? fillColor;
  final bool filled;

  // Other properties
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final bool readOnly;
  final VoidCallback? onTap;
  final AutovalidateMode autovalidateMode;

  const CustomTextFormField({
    super.key,
    // Basic
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,

    // Texts
    this.hintText,
    this.labelText,
    this.errorText,
    this.helperText,

    // Styles
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.errorStyle,
    this.helperStyle,

    // Icons
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,

    // Border
    this.borderRadius = 4,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.fillColor,
    this.filled = true,

    // Other
    this.contentPadding,
    this.autofocus = false,
    this.readOnly = false,
    this.onTap,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  Color _getBorderColor() {
    if (_hasError) {
      return widget.errorBorderColor ?? Colors.red;
    }
    if (_focusNode.hasFocus) {
      return widget.focusedBorderColor ?? AppColors.blue;
    }
    return widget.enabledBorderColor ?? AppColors.grey.withValues(alpha: 0.3);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        final error = widget.validator?.call(value);
        setState(() {
          _hasError = error != null;
        });
        return error;
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: _focusNode,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      autovalidateMode: widget.autovalidateMode,
      style:
          widget.textStyle ??
          AppTextStyles.regular14.copyWith(color: Colors.black),
      cursorColor: widget.focusedBorderColor ?? AppColors.blue,
      decoration: InputDecoration(
        // Texts
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            AppTextStyles.regular14.copyWith(color: AppColors.placeHolder),
        labelText: widget.labelText,
        labelStyle:
            widget.labelStyle ??
            AppTextStyles.regular12.copyWith(
              color: _hasError
                  ? (widget.errorBorderColor ?? Colors.red)
                  : _focusNode.hasFocus
                  ? (widget.focusedBorderColor ?? AppColors.blue)
                  : AppColors.grey,
            ),
        errorText: widget.errorText,
        errorStyle:
            widget.errorStyle ??
            AppTextStyles.regular12.copyWith(
              color: widget.errorBorderColor ?? Colors.red,
            ),
        helperText: widget.helperText,
        helperStyle: widget.helperStyle,

        // Icons
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefix,
        suffix: widget.suffix,

        // Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? AppColors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color:
                widget.enabledBorderColor ??
                AppColors.grey.withValues(alpha: 0.3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(color: widget.errorBorderColor ?? Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? Colors.red,
            width: 2,
          ),
        ),

        // Fill
        filled: widget.filled,
        fillColor:
            widget.fillColor ??
            (widget.enabled ? Colors.white : Colors.grey.shade50),

        // Padding
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
    );
  }
}
