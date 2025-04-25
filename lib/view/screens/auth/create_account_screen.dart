import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/repository/backend/auth_backend.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/screens.dart';
import 'package:music_minds/src/utils.dart';
import 'package:music_minds/view_model/auth/auth_view_model.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  bool isChecked = false;
  bool obscurePasswordText = true;
  bool obscureConfirmPasswordText = true;
  FocusNode emailFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode roleFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  bool? isSelectedRole;
  String? selectedRole;
  List<RoleClass>? roles;
  final authService = AuthBackend();

  @override
  void initState() {
    roles = [
      RoleClass('Male', false),
      RoleClass('Female', false),

      // Add more banks here...
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                headerTexts(),
                SizedBox(
                  height: 30.h,
                ),
                formFields(),
                SizedBox(
                  height: 12.h,
                ),
                termsAndPolicies(),
                SizedBox(
                  height: 190.h,
                ),
                submitButton(),
                SizedBox(
                  height: 28.h,
                ),
                alreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),

      // bottomSheet: Padding(
      //     padding: EdgeInsets.only(bottom: 20.h),
      //     child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: submitButton(),)),
    );
  }

  //This contains the Back Button and Header Texts
  Widget headerTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 15.h,
        ),
        TextView(
          text: TTexts.createAnAccount,
          fontSize: 28.spMin,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 6.h,
        ),
        TextView(
          text: TTexts.joinTheCommunity,
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  //Contains a list of form fields
  Widget formFields() {
    final Validators validators = Validators();
    var provider = ref.watch(authViewModel);
    final emailRes =
        validators.validateEmail(provider.emailSignUpController.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          fieldLabel: '',
          focusNode: firstNameFocusNode,
          hint: "Firstname",
          controller: provider.firstNameController,
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: lastNameFocusNode,
          hint: "Lastname",
          controller: provider.lastNameController,
        ),

        CustomTextField(
          fieldLabel: '',
          focusNode: userNameFocusNode,
          hint: "Username",
          controller: provider.userNameController,
          // validator: ref.watch(authViewModel).validators.validateEmail,
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: emailFocusNode,
          hint: "Email Address",
          controller: provider.emailSignUpController,
          // validator: ref.watch(authViewModel).validators.validateEmail,
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: passwordFocusNode,
          hint: "Password",
          password: true,
          controller: provider.passwordRegisterController,
          obscureInput: obscurePasswordText,
          onObscureText: () {
            togglePassWordVisibility();
          },
        ),
        CustomTextField(
          fieldLabel: '',
          focusNode: confirmPasswordFocusNode,
          hint: "Confirm Password",
          visibleField: true,
          password: true,
          controller: provider.passwordConfirmRegisterController,
          obscureInput: obscureConfirmPasswordText,
          onObscureText: () {
            toggleConfirmPassWordVisibility();
          },
          // useForgotPass: true,
        ),
        /*CustomTextField(
          fieldLabel: '',
          focusNode: roleFocusNode,
          hint: "Role",
          controller: TextEditingController(text: selectedRole ?? ''),
          readOnly: true,
          onTap: (){
            rolePopUp();
          },

          // useForgotPass: true,
        ),*/

        // CustomTextFieldSelect(
        //   fieldLabel: '',
        //   controller: TextEditingController(text: selectedRole ?? ''),
        //   focusNode: roleFocusNode,
        // )
        // MyForm()
      ],
    );
  }

  //Contains custom button
  submitButton() {
    var provider = ref.watch(authViewModel);
    return DefaultButtonMain(
      text: 'Create account',
      buttonState: provider.buttonRegisterState!.buttonState,
      onPressed: () async {

      },
    );
  }

  //Contains alreadyHaveAnAccount text widget
  alreadyHaveAnAccount() {
    return Center(
      child: RichText(
          text: TextSpan(
              text: TTexts.haveAnAccount,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.spMin,
                  fontFamily: TTexts.campTonFont,
                  fontWeight: FontWeight.w500),
              children: <TextSpan>[
            TextSpan(
                text: TTexts.login,
                style: TextStyle(
                    color: AppColors.KBlue,
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))),
          ])),
    );
  }

  //Contains termsAndPolicies text widget
  termsAndPolicies() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customCheckBox(),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: RichText(
              text: TextSpan(
                  text: TTexts.agreeTo,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.spMin,
                      fontFamily: TTexts.campTonFont,
                      fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                TextSpan(
                    text: TTexts.termsOfService,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.KBlue.withOpacity(0.8),
                        fontSize: 10.spMin,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                const TextSpan(
                  text: TTexts.acknowledgement,
                ),
                TextSpan(
                    text: TTexts.privacyPolicy,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.KBlue.withOpacity(0.8),
                        fontSize: 10.spMin,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                const TextSpan(
                  text: ' applies to you.',
                ),
              ])),
        ),
      ],
    );
  }

  //Contains customCheckBox widget
  customCheckBox() {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 18.w, // Adjust the size of the checkbox
        height: 18.h, // Adjust the size of the checkbox
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r), // Set the border radius
          border: Border.all(
            color: AppColors.KBlue, // Border color
            width: 1.w, // Border width
          ),
          color: isChecked
              ? Colors.transparent
              : Colors.transparent, // Fill color when checked
        ),
        child: isChecked
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 12.0.r,
                  color: AppColors.KBlue, // Checkmark color
                ),
              )
            : null,
      ),
    );
  }

  //Contains togglePassWordVisibility for password form field widget
  togglePassWordVisibility() {
    setState(() {
      obscurePasswordText = !obscurePasswordText;
    });
  }

  toggleConfirmPassWordVisibility() {
    setState(() {
      obscureConfirmPasswordText = !obscureConfirmPasswordText;
    });
  }

  rolePopUp() async {
    final deviceW = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;

    final selectedGenderValue = await showModalBottomSheet<String>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(deviceH * 0.04))),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(
                left: deviceW * 0.08,
                right: deviceW * 0.08,
                bottom: deviceH * 0.01),
            padding: EdgeInsets.only(top: deviceH * 0.01),
            height: 280.h,
            width: deviceW / 1.75,
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: deviceH * 0.03,
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {
                        navigateBack(context);
                      },
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.keyboard_arrow_down_outlined)),
                    ),
                  ]),

                  // Text(title, textAlign: TextAlign.center, style: kTitleStyle,),
                  TextView(
                    text: "Select role",
                  ),

                  SizedBox(
                    height: deviceH * 0.02,
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                        child: ListView.builder(
                          itemCount: roles!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: MaterialButton(
                                height: 52.h,
                                minWidth: double.infinity,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                                color: roles![index].isSelected
                                    ? AppColors.KBlue
                                    : null,
                                onPressed: () {
                                  _selectRole(index);
                                  Navigator.of(context).pop(roles![index].role);
                                },
                                child: TextView(
                                  text: roles![index].role,
                                  fontSize: 14.r,
                                  color: roles![index].isSelected
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
    if (selectedGenderValue != null) {
      setState(() {
        selectedRole = selectedGenderValue;
        // isSelected = true;
      });
    }
  }

  void _selectRole(int index) {
    setState(() {
      // Set isSelected property of the selected bank to true
      roles![index].isSelected = true;

      // Set isSelected property of all other banks to false
      for (int i = 0; i < roles!.length; i++) {
        if (i != index) {
          roles![i].isSelected = false;
        }
      }
    });
  }
  String _mapToDisplayValue(String value) {
    if (value == 'Male') {
      return 'MALE';
    }
    return 'FEMALE';
  }

}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController _controller = TextEditingController();
  bool showError = false;
  String? errorText;
  FocusNode _focusNode = FocusNode();
  // Validators get validators =>  _validators;
  final Validators validators = Validators();
  @override
  Widget build(BuildContext context) {
    final emailRes = validators.validateEmail(_controller.text);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: 'Enter text',
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: showError ? Colors.red : Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: (text) {
              setState(() {
                errorText = validators.validateEmail(text);
                showError = errorText != null;
              });
            },
          ),
          if (showError && _focusNode.hasFocus)
            Text(
              // errorText ?? '',
              validators.validateEmail(_controller.text) ?? '',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class RoleClass {
  final String role;
  // final String code;
  bool isSelected;

  RoleClass(this.role, this.isSelected);
}
