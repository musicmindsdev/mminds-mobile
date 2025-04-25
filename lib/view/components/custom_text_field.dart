import 'package:flutter/material.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/validator.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.fieldLabel,
    super.key,
    this.height,
    this.width,
    this.hint,
    this.controller,
    this.labelHint = '',
    this.spacing,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding,
    this.prefixIcon,
    this.password = false,
    this.trailing,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.isFilled = true,
    this.fillColor = AppColors.KFormfieldBlueFill,
    this.borderColor,
    // this.validator,
    this.onChanged,
    this.obscureInput = false,
    this.onObscureText,
    this.borderRadius = 8,
    this.maxlength,
    this.enabled = true,
    this.useForgotPass = false,
    this.onForgotPassTap,
    this.visibleField = true,
    this.borderWidth = 1,
    required this.focusNode,
    this.showError = false,
    this.errorText,
    this.validators,
  });

  final String? hint;
  final String fieldLabel;
  final String labelHint;
  final double? spacing;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final bool? password;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final int? maxLines;
  final double? borderWidth;
  final bool isFilled;
  final Color? fillColor;
  final Color? borderColor;
  // final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureInput;
  final void Function()? onObscureText;
  final double borderRadius;
  final int? maxlength;
  final bool useForgotPass;
  final bool enabled;
  final void Function()? onForgotPassTap;
  final bool visibleField;
  final double? width;
  final double? height;
  final FocusNode focusNode;
  final bool? showError;
  final String? errorText;
  final Validators? validators;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // myFocusNode = focusNode;
  @override
  Widget build(BuildContext context) {
    String? myerrorText;
    // widget.errorText.toString();
    final myFocusNode = widget.focusNode;
    final validators = widget.validators;
    var _showError = widget.showError;
    final Validators validatorOne = Validators();
    final theme = Theme.of(context);
    return Visibility(
      visible: widget.visibleField,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.only(bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* RichText(
              text: TextSpan(
                text: fieldLabel,
                style: theme.textTheme.labelLarge!.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: labelHint.isNotEmpty ? ' ($labelHint)' : '',
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: AppColors.KFormfieldBlueBorder,
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),*/

            // spacer between lable and text field
            /*SizedBox.square(
              dimension: spacing ?? 10,
            ),*/

            TextFormField(
              maxLength: widget.maxlength,
              controller: widget.controller,
              focusNode: myFocusNode,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Campton',
                fontSize: 14.spMin,
              ),
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue,
              textCapitalization: widget.textCapitalization,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              enabled: widget.enabled,
              textAlign: widget.textAlign,
              maxLines: widget.maxLines ?? 1,
              // validator: widget.validators,
              // onChanged: onChanged,
              onChanged: (text) {
                setState(() {
                  myerrorText =validatorOne.validateEmail(text);
                  // validateText(text, widget.validators!.validateEmail);
                  _showError = myerrorText != null;
                });
              },
              obscureText: widget.obscureInput,
              decoration: InputDecoration(
                border: widget.readOnly ? InputBorder.none : null,
                hintText: widget.hint,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.KNeutralFormFieldText,
                  fontFamily: 'Campton',
                  fontSize: 14.spMin,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.textAlign == TextAlign.center
                    ? null
                    : Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Visibility(
                            visible: widget.password!,
                            child: GestureDetector(
                              onTap: widget.onObscureText,
                              child: Container(
                                height: 40.h,
                                width: 45.w,
                                // color: Colors.red,
                                child: Icon(
                                  widget.obscureInput
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 20.r,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.trailing != null,
                            child: widget.trailing ?? const SizedBox(),
                          ),
                        ],
                      ),
                filled: widget.isFilled,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                fillColor: widget.fillColor ?? theme.cardColor,
                enabledBorder: widget.isFilled
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          color: widget.borderColor ??
                              AppColors.KFormfieldBlueBorder,
                        ),
                      )
                    : InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color: AppColors.KFormfieldBlueBorderFocused,
                      width: widget.borderWidth!.sp),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(color: AppColors.KErrorPrimary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: const BorderSide(color: AppColors.KErrorPrimary),
                ),
                errorStyle: const TextStyle(color: AppColors.KErrorPrimary),
                errorMaxLines: 4,
              ),
            ),
            // if (myFocusNode.hasFocus)
            //   Text(
            //     // 'Hello',
            //     validatorOne.validateEmail(widget.controller!.text) ?? '',
            //     // widget.validators!.validateEmail(widget.controller!.text) ?? '',
            //     style: TextStyle(color: Colors.red),
            //   ),

            Gap(
              5.spMin,
            ),

            Visibility(
              visible: widget.useForgotPass,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onForgotPassTap,
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: AppColors.kAshBlue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Campton',
                      fontSize: 12.spMin,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateText(
      String text, String? Function(String) validationFunction) {
    return validationFunction(text);
  }
}

///
///
///
///


