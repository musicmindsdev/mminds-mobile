import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/view/components/custom_password/requirements_widgets.dart';
import 'package:music_minds/view_model/theme_view_model.dart';

class PasswordValidatedFields extends ConsumerStatefulWidget {
  /// Constructor
  const PasswordValidatedFields({
    super.key,

    /// [default inputDecoration]
    this.inputDecoration = const InputDecoration(
      hintText: 'Enter password',
      prefixIcon: Icon(Icons.lock),
      border: OutlineInputBorder(),
    ),
    this.textEditingController,
    this.spacing,

    /// [default textInputAction]
    this.textInputAction = TextInputAction.done,
    this.onEditComplete,
    this.confirmPasswordWidget,
    this.onFieldSubmitted,
    this.focusNode,
    this.cursorColor,
    required this.fieldLabel,
    this.onObscureText,
    this.obscureInput = false,
    this.borderRadius = 8,
    this.borderWidth = 1.0,
    this.isFilled = true,
    // const Color(0xffF9F9F9),
    this.borderColor,
    this.fillColor = AppColors.KFormfieldBlueFill,
    this.readOnly = false,

    /// Password requirements initialization
    /// [default inActiveIcon]
    this.inActiveIcon = Icons.check_circle_outline_rounded,

    /// [default activeIcon]
    this.activeIcon = Icons.check_circle_rounded,

    /// [default inActive Color]
    this.inActiveRequirementColor = Colors.grey,

    /// [default active color]
    this.activeRequirementColor = Colors.blue,
  });

  /// Password `validation` is given at the bottom which can be `modified` accordingly.
  /// Full package can be modified easily

  /// Input decoration of Text field by default it is OutlineInputBorder
  final InputDecoration? inputDecoration;

  /// textEditingController for the field
  final TextEditingController? textEditingController;

  // ignore: comment_references
  /// textInputAction for the field. By default its set to [done]
  final TextInputAction? textInputAction;

  /// onEditComplete callBack for the field
  final void Function()? onEditComplete;

  /// onFieldSubmitted callBack for the field
  final String Function(String)? onFieldSubmitted;

  /// focusNode for the field
  final FocusNode? focusNode;
  final Widget? confirmPasswordWidget;

  /// cursorColor
  final Color? cursorColor;

  /// Password requirements attributes
  /// iconData for the icons when requirement is completed
  final IconData? activeIcon;

  /// iconData for the icons when the requirement is incomplete/inActive
  final IconData? inActiveIcon;

  /// color of the text when requirement is completed
  final Color? activeRequirementColor;

  /// color of the text when the requirement is not completed/inActive
  final Color? inActiveRequirementColor;

  final bool obscureInput;
  final bool isFilled;
  final double? borderWidth;
  final double borderRadius;
  final double? spacing;
  final Color? borderColor;
  final Color? fillColor;
  final bool readOnly;
  final String fieldLabel;

  final void Function()? onObscureText;

  @override
  PasswordValidatedFieldsState createState() => PasswordValidatedFieldsState();
}

class PasswordValidatedFieldsState
    extends ConsumerState<PasswordValidatedFields> {
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var themeMode = ref.watch(themeViewModel).themeMode;
    final myFocusNode = widget.focusNode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// [Password TextFormField]
        /// Use `Form` to validate the field easily
        ///

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              textInputAction: widget.textInputAction,
              controller: widget.textEditingController,
              keyboardType: TextInputType.text,
              obscureText: widget.obscureInput,
              readOnly: widget.readOnly,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.spMin,
              ),
              decoration: InputDecoration(
                border: widget.readOnly ? InputBorder.none : null,
                hintText: TTexts.enterPwd,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.KNeutralFormFieldText,
                  fontFamily: TTexts.campTonFont,
                  fontSize: 14.spMin,
                ),

                suffixIcon: GestureDetector(
                  onTap: widget.onObscureText,
                  child: Icon(
                    widget.obscureInput
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20.r,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                filled: true,
                fillColor: widget.fillColor ?? theme.cardColor,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),

                // fillColor: widget.fillColor ?? theme.cardColor,
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
                // prefixIcon: Icon(Icons.lock),
              ),
              onEditingComplete: widget.onEditComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              focusNode: widget.focusNode,
              cursorColor: widget.cursorColor,
              onChanged: (value) {
                setState(() {
                  _pass = value;
                });
              },
              validator: passwordValidation,
            ),
          ],
        ),

        SizedBox(height: 12.h),

        widget.confirmPasswordWidget!,
        SizedBox(height: 10.h),


        /// [default requirements]
        /// `1 Upper case` requirement
        if (widget.textEditingController!.text.isEmpty)
          Container()
        else
          Column(
            children: [
              Wrap(
                spacing: 5.0.w, // Horizontal space between items
                runSpacing: 8.0.h, // Vertical space between rows
                children: [
                  PassCheckRequirements(
                    passCheck: _pass.contains(RegExp('[A-Z]')),
                    requirementText: '1 Uppercase [A-Z]',
                  ),

                  /// `1 lowercase` requirement
                  PassCheckRequirements(
                    passCheck: _pass.contains(RegExp('[a-z]')),
                    requirementText: '1 lowercase [a-z]',
                  ),

                  /// `1 numeric value` requirement
                  PassCheckRequirements(
                    passCheck: _pass.contains(RegExp('[0-9]')),
                    requirementText: '1 numeric value [0-9]',
                  ),
                  /// `1 special character` requirement
                  PassCheckRequirements(
                    passCheck: _pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
                    requirementText: r'1 special character [#, $, % etc..]',
                  ),
                  /// `6 character length` requirement
                  PassCheckRequirements(
                    passCheck: _pass.length >= 6,
                    requirementText: '6 characters minimum',
                  ),

                ],
              ),
              SizedBox(height: 20.h,)
            ],
          ),
      ],
    );
  }

  /// [password validation]
  /// 1 Uppercase
  /// 1 lowercase
  /// 1 numeric value
  /// 1 special character
  /// 6 length password

  /// In case you want to `modify` the requirements change the `RegExp` given below
  String? passwordValidation(String? value) {
    final passValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')

            /// [RegExp]
            .hasMatch(value!);
    if (value.isEmpty) {
      return 'Password cannot be emtpy!';
    } else if (!passValid) {
      return 'Requirement(s) missing!';
    }
    return null;
  }

  int _calculatePasswordStrength() {
    int strength = 0;

    if (_pass.contains(RegExp('[A-Z]'))) strength++; // 1 uppercase
    if (_pass.contains(RegExp('[a-z]'))) strength++; // 1 lowercase
    if (_pass.contains(RegExp('[0-9]'))) strength++; // 1 numeric
    if (_pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      strength++; // 1 special character
    }
    if (_pass.length >= 6) strength++; // Minimum length

    // Map strength to bar level
    if (strength >= 4.5) return 3; // Green
    if (strength >= 2.5) return 2; // Amber
    return 1; // Red
  }
}
