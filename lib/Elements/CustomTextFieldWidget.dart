import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final double? prefixIconSize;
  final Color? suffixIconColor;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final TextStyle? suffixStyle;
  final TextStyle? prefixStyle;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? inputTextStyle;
  final String? btnLabel;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final AutovalidateMode? autoValidateMode;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final Color? backgroundColor;
  final Color? cursorColor;
  final Color? hintColor;
  final Color? textColor;
  final double? hintSize;
  final double? textSize;
  final int? hintMaxLines;
  final EdgeInsetsGeometry? containerMargin;
  final EdgeInsetsGeometry? containerPadding;
  final int? maxLines;
  final double? suffixIconSize;
  final TextAlign? textAlign;
  final String? initialTextValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final bool isPasswordField;
  final bool isSecure;
  final IconData? prefixIcon;
  final Widget? hint;
  final VoidCallback? onSuffixTap;
  final bool isSuffixIcon;
  final double? suffixIconHeight;
  final double? suffixIconWidth;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? textInputFormatters;
  final String? labelText;
  final BoxBorder? textFieldBorder;
  final bool removeBorder;
  final Color? prefixIconColor;
  final Widget? suffixIcon;

  const MyTextField({
    super.key,
    this.btnLabel,
    this.onSuffixTap,
    this.initialTextValue,
    this.hintMaxLines,
    this.hintStyle,
    this.containerMargin,
    this.suffixIcon,
    this.suffixIconColor,
    this.textColor,
    this.suffixIconSize,
    this.hintSize,
    this.focusNode,
    this.prefixIconSize,
    this.textAlign,
    this.textSize,
    this.prefixIconConstraints,
    this.backgroundColor,
    this.hintColor,
    this.cursorColor,
    this.controller,
    this.borderRadius,
    this.hintText,
    this.inputTextStyle,
    this.onTap,
    this.height,
    this.textInputAction,
    this.contentPadding,
    this.width,
    this.maxLines,
    this.readOnly = false,
    this.suffixStyle,
    this.prefixStyle,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.autoValidateMode,
    this.border,
    this.focusedBorder,
    this.enableBorder,
    this.containerPadding,
    this.decoration,
    this.isPasswordField = false,
    this.isSecure = false,
    this.prefixIcon,
    this.isSuffixIcon = false,
    this.removeBorder = false,
    this.hint,
    this.suffixIconHeight,
    this.suffixIconWidth,
    this.textInputFormatters,
    this.onChanged,
    this.labelText,
    this.textFieldBorder,
    this.prefixIconColor,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isTextObscured;


  @override
  void initState() {
    super.initState();
    isTextObscured = widget.isSecure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 56,
      // fixed height
      margin: widget.containerMargin,
      padding:
          widget.containerPadding ?? const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        color: widget.backgroundColor ?? Colors.white,
        border: widget.removeBorder
            ? null
            : (widget.textFieldBorder ??
            Border.all(
              color: const Color(0xFF909090),
              width: 0.5,
            )),
      ),
      child: Center(
        child: TextFormField(
          onChanged: widget.onChanged,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          focusNode: widget.focusNode,
          inputFormatters: widget.textInputFormatters,
          initialValue: widget.initialTextValue,
          textAlign: widget.textAlign ?? TextAlign.start,
          autovalidateMode: widget.autoValidateMode,
          onTap: widget.onTap,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isPasswordField ? isTextObscured : false,
          obscuringCharacter: "*",
          readOnly: widget.readOnly,
          autofocus: false,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          cursorColor: widget.cursorColor ?? Colors.black,
          decoration:
              widget.decoration ??
              InputDecoration(
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFFE576BD),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                isDense: true,
                prefixIcon: widget.prefixIcon != null && !widget.isSuffixIcon
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          widget.prefixIcon!,
                          size:  widget.prefixIconSize ?? 25,
                          color: widget.prefixIconColor ?? const Color(0xff7B7B7B),
                        ),
                      )
                    : null,
                prefixIconConstraints:
                    widget.prefixIconConstraints ??
                    const BoxConstraints(minWidth: 36, minHeight: 36),
                suffixStyle: widget.suffixStyle,
                suffixIcon: widget.isPasswordField
                    ? IconButton(
                  icon: Icon(
                    isTextObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: widget.suffixIconColor ?? Colors.black54,
                    size: widget.suffixIconSize ?? 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  onPressed: () {
                    setState(() {
                      isTextObscured = !isTextObscured;
                    });
                  },
                )
                    : widget.suffixIcon ?? (widget.isSuffixIcon && widget.prefixIcon != null
                    ? GestureDetector(
                  onTap: widget.onSuffixTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      widget.prefixIcon!,
                      size: widget.prefixIconSize ?? 25,
                      color: const Color(0xff8697AC),
                    ),
                  ),
                )
                    : null),

                filled: false,
                hintText: widget.hintText,
                hint: widget.hint,
                contentPadding:
                    widget.contentPadding ??
                    const EdgeInsets.symmetric(vertical: 16),
                hintStyle:
                    widget.hintStyle ??
                    TextStyle(
                      fontFamily: 'Poppins',
                      color: widget.hintColor ?? const Color(0xFF909090),
                      fontSize: widget.hintSize ?? 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
          style:
              widget.inputTextStyle ??
              TextStyle(
                color: widget.textColor ?? Colors.black,
                fontFamily: 'Poppins',
                fontSize: widget.textSize ?? 15,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
