import 'package:flutter/services.dart';

import '../../app_exporter.dart';

/// This is a custom text field widget for all text fields in our app
class CustomTextField extends StatelessWidget {
  /// [CustomTextField] constructor
  const CustomTextField({
    required this.hintText,
    required this.keyboardType,
    required this.restorationId,
    super.key,
    this.initialValue,
    this.label = '',
    this.onChanged,
    this.validator,
    this.style,
    this.labelStyle,
    this.numLines = 1,
    this.labelText,
    this.controller,
    this.inputFormatters,
    this.autofillHints,
    this.obscureText = false,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconImagePath,
    this.fillColor = appColor,
    this.textColor = appColor,
    this.fieldErrorColor = errorColor,
    this.focusNode,
    this.hasUnderlinedDecoration = false,
    this.showLabel = true,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next,
  });

  /// restorationId for the text field
  final String restorationId;

  /// whether to show the label or not
  final bool showLabel;

  /// label for the text field
  final String label;

  /// initial value for the text field
  final String? initialValue;

  /// label text
  final String? labelText;

  /// style for the text field
  final TextStyle? style;

  /// focus node to focus and unfocus the text field
  final FocusNode? focusNode;

  /// label style
  final TextStyle? labelStyle;

  /// number of lines for the text field
  final int numLines;

  /// max length for the text field
  final int? maxLength;

  /// what to do when the text field value changes
  final void Function(String value)? onChanged;

  /// validator for the text field
  final String? Function(String? value)? validator;

  /// hint text for the text field
  final String hintText;

  /// controller for the text field
  final TextEditingController? controller;

  /// autofill hints for the text field
  final List<String>? autofillHints;

  /// whether to obscure the text or not
  final bool obscureText;

  /// keyboard type for the text field
  final TextInputType keyboardType;

  /// action to be shown on the soft keyboard
  final TextInputAction textInputAction;

  /// prefix icon for the text field
  final IconData? prefixIcon;

  /// fill color for the text field
  final Color fillColor;

  /// fieldErrorColor
  final Color fieldErrorColor;

  /// text color for the text field
  final Color textColor;

  /// suffix icon for the text field
  final Widget? suffixIcon;

  /// text alignment for the text field
  final TextAlign textAlign;

  /// prefix icon image path
  final String? prefixIconImagePath;

  /// whether to show underlined decoration or not
  final bool hasUnderlinedDecoration;

  /// input formatters to format the text as it is input by the user
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final fieldTextStyle = style ??
        GoogleFonts.montserrat(
          fontSize: 16,
          color: textColor,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showLabel && !hasUnderlinedDecoration) ...[
          /// label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText ?? hintText,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: fillColor,
              ),
            ),
          ),
          const Spacing(of: 5),
        ],

        /// text field
        TextFormField(
          restorationId: restorationId,
          controller: controller,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters ??
              [
                LengthLimitingTextInputFormatter(maxLength),
              ],
          validator: validator,
          textAlign: textAlign,
          onChanged: onChanged,
          initialValue: initialValue,
          style: fieldTextStyle,
          focusNode: focusNode,
          minLines: numLines,
          maxLines: numLines,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: textColor.withOpacity(.3)),
            filled: true,
            fillColor: fillColor.withOpacity(0.05),

            /// * Error Styling
            errorMaxLines: 5,
            errorStyle: TextStyle(
              color: fieldErrorColor,
            ),
            errorBorder: hasUnderlinedDecoration
                ? UnderlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fieldErrorColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fieldErrorColor,
                    ),
                  ),
            focusedErrorBorder: hasUnderlinedDecoration
                ? UnderlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fieldErrorColor,
                      width: 2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fieldErrorColor,
                      width: 2,
                    ),
                  ),

            /// * Enabled
            enabledBorder: hasUnderlinedDecoration
                ? UnderlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fillColor,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fillColor,
                    ),
                  ),

            /// * Focused
            focusedBorder: hasUnderlinedDecoration
                ? UnderlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fillColor,
                      width: 2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: borderRadius8,
                    borderSide: BorderSide(
                      color: fillColor,
                      width: 2,
                    ),
                  ),
            isDense: true,

            ///Icons
            //* prefix
            prefixIcon: prefixIconImagePath != null
                ? ImageIcon(
                    AssetImage(prefixIconImagePath!),
                    color: textColor,
                  )
                : prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: textColor,
                      )
                    : null,

            suffixIcon: suffixIcon,
          ),
          obscuringCharacter: '*',
          autovalidateMode: AutovalidateMode.onUserInteraction,

          /// * cursor
          cursorColor: fillColor,
          cursorRadius: const Radius.circular(12),
          textInputAction: textInputAction,

          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
