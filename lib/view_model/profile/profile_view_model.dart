import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:music_minds/model/response/response/user_response_model.dart';
import 'package:music_minds/repository/backend/profile_backend.dart';
import 'package:music_minds/routing/app_routing.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/view/components/custom_alerts.dart';
import 'package:music_minds/view/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_minds/src/models.dart';
import 'package:music_minds/src/repository.dart';
import 'package:music_minds/src/config.dart';
import 'package:music_minds/src/utils.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  final profileService = ProfileBackend();
  final authService = AuthBackend();
  bool _obscurePasswordText = true;
  bool _obscureConfirmPwdText = true;
  bool _obscureOldPwdText = true;
  bool _isChecked = false;
  final TextEditingController dateController = TextEditingController();

  File? _image;

  File? get image  => _image;
  final List<File?> _identificationImageList = [];
  List<File?> get identificationImageList => _identificationImageList;


  CustomButtonState _buttonChangePwdState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.continueText,
  );
  CustomButtonState? get buttonChangePwdState => _buttonChangePwdState;

  List<File?> driversLicenseFrontAndBckImage = [];
  List<File?> imageFrontAndBckImage = [];
  final bool _isFetchingBanks = false;
  final updateFormKey = GlobalKey<FormState>();

  String appVersion = '';
  String buildNumber = '';
  bool get obscurePasswordText => _obscurePasswordText;

  bool get obscureConfirmPwdText => _obscureConfirmPwdText;
  bool get obscureOldPwdText => _obscureOldPwdText;


  bool _isSubmittingKYC = false;
  bool get isSubmittingKYC => _isSubmittingKYC;
  CustomButtonState _buttonSubmitKYCState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: TTexts.login,
  );

  final TextEditingController _validatePasswordControllers =
      TextEditingController();
  TextEditingController get validatePasswordControllers =>
      _validatePasswordControllers;
  final TextEditingController _firstNameController =
      TextEditingController(text: DummyData.firstName ?? '');
  final TextEditingController _lastNameController =
      TextEditingController(text: DummyData.lastName ?? '');
  final TextEditingController _emailAddressController =
      TextEditingController(text: DummyData.emailAddress ?? '');
  final TextEditingController _phoneNumberController =
      TextEditingController(text: DummyData.phoneNumber ?? '');

  // final bvnFormKey = GlobalKey<FormState>();

  final bool _validatePassword = true;
  bool get validatePassword => _validatePassword;

  UserResponseModel? _profileData;

  UserResponseModel? get profileData => _profileData;
  File? proofOfId;
  File? proofOfAddress;

  File? ninImageFront;
  File? ninImageBack;

  File? intlPassportImageFront;
  File? intlPassportImageBack;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get oldPasswordController => _oldPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;

  ///KYC
  final TextEditingController _bvnController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  TextEditingController get bvnController => _bvnController;
  TextEditingController get idNumberController => _idNumberController;
  TextEditingController get addressController => _addressController;
  String? selectedIdType = '';
  List<String> identificationType = [
    'Passport',
    'National ID Card',
    'Voter ID Card',
    'Tax Identification Number (TIN) Card'
  ];

  updateSelectedIdType (value){
    selectedIdType = value;
    notifyListeners();
  }
  String? _documentType;
  String? get documentType => _documentType;
  // String get accountName => _accountName;

  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get firstNameController => _firstNameController;

  CustomButtonState get buttonSubmitKYCState => _buttonSubmitKYCState;
  bool isBankAccountNumberAdded = false;

  bool _isUpdatingUserProfile = true;
  bool get isUpdatingUserProfile => _isUpdatingUserProfile;

  bool _isDeletingUserProfile = true;
  bool get isDeletingUserProfile => _isDeletingUserProfile;

  final bool _isAddingBankDetails = false;
  bool get isAddBankDetails => _isAddingBankDetails;

  final bool _isFetchingLandlordBanks = true;


  double _uploadProgress = 0.0;
  bool _showUploadIndicator = false;

  double get uploadProgress => _uploadProgress;
  bool get showUploadIndicator => _showUploadIndicator;

  bool isVerifyingKycBvn = false;


  void copyToClipBoard(context, {required String value}) {
    Clipboard.setData(
      ClipboardData(text: value.toString()),
    );
    showToast(msg: "Copied '$value' to clipboard", isError: false);
  }

  ///Method to update user profile
  Future<void> updateUserProfile(BuildContext context) async {
    if (updateFormKey.currentState!.validate()) {
      updateFormKey.currentState!.save();
      _isUpdatingUserProfile = true;
      notifyListeners();

      // Display CustomAlert

      try {
        await profileService
            .updateUserProfile(

          phoneNumber: _phoneNumberController.text.toString(), username: '',
        )
            .then((value) async {
          if (value != null) {
            final decodedResponse = jsonDecode(value.toString());

            // Dismiss CustomAlert before showing toast
            Navigator.of(context, rootNavigator: true).pop();
            // Add a short delay to ensure the alert is dismissed
            await Future.delayed(const Duration(milliseconds: 30));

            if (decodedResponse['status'].toString() == 'success') {
              showToast(
                msg: decodedResponse['message'].toString(),
                isError: false,
              );
              loadData(context);
              _isUpdatingUserProfile = false;
              notifyListeners();
            } else {
              showToast(
                msg: decodedResponse['message'].toString(),
                isError: true,
              );
              _isUpdatingUserProfile = false;
              notifyListeners();
            }
          }
        }).whenComplete(() {
          _isUpdatingUserProfile = false;
          notifyListeners();
        });
      } catch (e, s) {
        logger
          ..i(TTexts.checkErrorLogs)
          ..e(s);
        showToast(
          msg: TTexts.somethingWentWrong,
          isError: true,
        );
        // Dismiss CustomAlert in case of an error
        Navigator.of(context, rootNavigator: true).pop();
        showToast(
          msg: TTexts.somethingWentWrong,
          isError: true,
        );
        _isUpdatingUserProfile = false;
        notifyListeners();
      }
    }
  }

  resetIsUpdatingUserProfile() {
    _isUpdatingUserProfile = true;
    notifyListeners();
    logger.wtf(isUpdatingUserProfile.toString());
  }

//Method to delete user profile.
  Future<void> deleteUserProfile(BuildContext context) async {

    try {
      _isDeletingUserProfile = true;
      notifyListeners();
      await profileService.deleteProfile().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'success') {
            _validatePasswordControllers.clear();
            showToast(
              msg: decodedResponse['message'].toString(),
              isError: false,
            );
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('Email');
            await prefs.remove('Password');
            await prefs.remove('accessToken');
            await prefs.remove('firstTimeOnApp');
            DummyData.firstName = '';
            DummyData.lastName = '';
            await Future.delayed(const Duration(seconds: 2));
            _isDeletingUserProfile = false;
            Navigator.of(context).pushAndRemoveUntil(
              // the new route
              MaterialPageRoute(
                  builder: (BuildContext context) => const OnboardingTestScreen()),
              (Route route) => false,
            );

            notifyListeners();

            // ignore: use_build_context_synchronously
            // WidgetRebirth.createRebirth(context: context);

            // notifyListeners();
          } else if (decodedResponse['status'].toString() == 'error') {
            showToast(
              msg: value['message'].toString(),
              isError: false,
            );

            _isDeletingUserProfile = false;
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _isDeletingUserProfile = false;
        // Navigator.of(context, rootNavigator: true).pop();
        notifyListeners();
      });
    } catch (e, s) {
      Navigator.of(context, rootNavigator: true).pop();
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  Future<void> changePwd(
    context,
  ) async {
    try {
      _buttonChangePwdState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.continueText,
      );
      notifyListeners();
      await authService
          .changePassword(
              oldPassword: _oldPasswordController.text,
              newPassword: _newPasswordController.text)
          .then((value) async {
        if (value != null) {
          // Dismiss CustomAlert before showing toast
          Navigator.of(context, rootNavigator: true).pop();
          // Add a short delay to ensure the alert is dismissed
          await Future.delayed(const Duration(milliseconds: 30));
          // final decodeResponse = jsonDecode(value.toString());
          if (value['status'].toString() == 'success') {
            _buttonChangePwdState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.continueText,
            );
            showToast(
              msg: value['message'].toString(),
              isError: false,
            );
          } else if (value['status'].toString() == 'false') {
            // showToast(
            //   msg: value['message'].toString(),
            //   isError: true,
            // );
            // notifyListeners();
          }
        }
      }).whenComplete(() {
        _buttonChangePwdState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: TTexts.continueText,
        );
        notifyListeners();
      });
    } catch (e, s) {
      Navigator.of(context, rootNavigator: true).pop();
      showToast(
        msg: TTexts.somethingWentWrong,
        isError: true,
      );
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  ///Method for Submitting KYC
  Future<void> submitKYC(BuildContext context) async {
    _isSubmittingKYC = true;
    try {
      _buttonSubmitKYCState = CustomButtonState(
        buttonState: ButtonState.loading,
        text: TTexts.login,
      );
      notifyListeners();
      await profileService
          .submitKYC(

              // attachments: imageFrontAndBckImage,
              bvn: bvnController.text,
              address: addressController.text,
              proofOfAddress: proofOfAddress!,
              proofOfId: proofOfId!)
          .then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());
          logger.t(decodedResponse['status'] == 'success');
          if (decodedResponse['status'] == 'success') {
            showToast(
              msg: decodedResponse['message'].toString(),
              isError: false,
            );
            // await Navigator.of(context).pushAndRemoveUntil(
            //   // the new route
            //   MaterialPageRoute(
            //       builder: (BuildContext context) => const SuccessScreen(
            //           title: TTexts.verificationSent,
            //           subTitle: TTexts.noShortestTime)),
            //   (Route route) => false,
            // );
            clearKYCData();
            _buttonSubmitKYCState = CustomButtonState(
              buttonState: ButtonState.idle,
              text: TTexts.login,
            );
            _isSubmittingKYC = false;
            notifyListeners();
            // fetchKYC(context);
          } else {
            _isSubmittingKYC = false;

            showToast(
              msg: decodedResponse['message'].toString(),
              isError: true,
            );
          }

          notifyListeners();
        }
      }).whenComplete(() async {
        _isSubmittingKYC = false;

        _buttonSubmitKYCState = CustomButtonState(
          buttonState: ButtonState.idle,
          text: TTexts.login,
        );
        notifyListeners();
      });
    } catch (e, s) {
      // showToast(
      //   msg: TTexts.somethingWentWrong,
      //   isError: true,
      // );
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
  }

  // Future kycBvnVerification() async {
  //   try {
  //     isVerifyingKycBvn = true;
  //     notifyListeners();
  //     await profileService.kycBvnVerification(idType: 'BVN', idNumber: _bvnController.text).then((value) async {
  //       if (value != null) {
  //         // final decodedResponse = jsonDecode(value.toString());
  //         if (value['status'].toString() == 'success') {
  //           isVerifyingKycBvn = false;
  //           showToast(msg: value['message'], isError: false);
  //           notifyListeners();
  //         }
  //       }
  //       notifyListeners();
  //     }).whenComplete(() {
  //       isVerifyingKycBvn = false;
  //       notifyListeners();
  //     });
  //   } catch (e, s) {
  //     logger
  //       ..i(TTexts.checkErrorLogs)
  //       ..e(s);
  //   }
  // }


  ///Method for Picking Multiple Image
  pickImageAsList() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    notifyListeners();
    if (pickedFile != null) {
      // _image = File(pickedFile.path);
      driversLicenseFrontAndBckImage.add(File(pickedFile.path));
      notifyListeners();
      logger.i('Image Path $driversLicenseFrontAndBckImage');
    } else {}
  }

  /// Method to pick Single Image from gallery
  Future<File?> pickSingleImageOne() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    notifyListeners();

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      notifyListeners();
      logger.f('Image Path $imageFile');
      final bytes = imageFile.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      logger.t("${kb}KB");
      logger.i("${kb}KB");

      return imageFile; // Return the picked file
    }

    return null; // Return null if no image is picked
  }

  Future<File?> updateProofOfIdentificationImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      proofOfId = pickedImage;
      notifyListeners();
    }
    return null;
  }

  Future<File?> updateProofOfAddressImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      proofOfAddress = pickedImage;
      notifyListeners();
    }
    return null;
  }

  pickMultipleImage(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickMultiImage(
      imageQuality: 50,
    );
    notifyListeners();
    // _image = File(pickedFile.path);
    if (pickedFile.isNotEmpty && pickedFile.length <= 2) {
      for (int i = 0; i < pickedFile.length; i++) {
        _identificationImageList.add(File(pickedFile[i].path));
        notifyListeners();
      }
      notifyListeners();
      logger.f('Image Path ${_identificationImageList.length}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextView(
            text: "You can only select up to 3 images.",
            color:Colors.white,
            fontSize: 16.spMin,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  void clearKYCData() {
    _bvnController.clear();
    proofOfId = null;
    proofOfAddress = null;
    addressController.clear();
    notifyListeners();
  }

  Future<void> updateProfilePhoto(BuildContext context) async {
    try {
      await profileService.uploadProfileAvatar(
        context,
        onSendProgress: (int sent, int total) {
          /// In the code snippet provided, `final progress = sent / total * 1;` is calculating the
          /// progress percentage of the file upload.
          final progress = (sent / total) * 0.1;
          //
          _showUploadIndicator = true;
          _uploadProgress = progress;
          notifyListeners();

          // logger.d(
          //   'progress: ${progress.toStringAsFixed(1)}% ($sent/$total)',
          // );
        },
      ).then((dynamic value) async {
        /// Once the file upload is complete, the response is decoded using `jsonDecode`.
        /// The `profileData` object is then updated with the new profile photo URL from the response. Finally, the `notifyListeners` method is called to notify any listeners that the profile data has changed.
        ///
        /// Overall, the `updateProfilePhoto` method handles the file upload, updates the profile data with the new photo URL, and notifies listeners of the change.

        // final decodeResponse = jsonDecode(value.toString());
        // profileData!.data!.profilePhoto =
        // decodeResponse['data']['profilePhoto'] as String;
        await loadData(context);
        notifyListeners();
      }).whenComplete(() {
        // hide progress indicator when
        //upload is complete
        _showUploadIndicator = false;
        // notifyListeners();
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<UserResponseModel?> loadData(BuildContext context) async {
    try {
      await profileService.getProfileData().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'success') {
            _profileData = UserResponseModel.fromJson(decodedResponse);
            DummyData.fullName = _profileData!.data!.name.toString();
            DummyData.emailAddress = _profileData!.data!.email ?? "";
            DummyData.userName = _profileData!.data!.username ?? "";
            DummyData.userId = _profileData!.data!.id.toString();
            await saveUserId(DummyData.userId);
            await getUserId();
            notifyListeners();
            // _gender =  _profileData!.gender.toString();
          }
        }
        notifyListeners();
      }).whenComplete(() {
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: TTexts.somethingWentWrong,
        isError: true,
      );
      logger
        ..i(TTexts.checkErrorLogs)
        ..e(s);
    }
    return _profileData;
  }

  int _currentListIndex = 0;
  int get currentListIndex => _currentListIndex;

  void pageChange(index) {
    _currentListIndex = index;
    notifyListeners();
  }

  void backBtnControl(
      BuildContext context,
      ) {
    if (_currentListIndex > 0) {
      _currentListIndex--;
    } else {
      navigateBack(context);
    }
    notifyListeners();
  }

  nextBtnControl(
      BuildContext context,
      ) async {
    switch (_currentListIndex) {
      case 0:
        if (_bvnController.text.trim().isNotEmpty && _firstNameController.text.trim().isNotEmpty &&  _lastNameController.text.trim().isNotEmpty) {
          _currentListIndex++;
          notifyListeners();
        } else {
          showToast(msg: 'Fill up the fields', isError: true);
        }
      default:
        if (selectedIdType.toString().isNotEmpty && _identificationImageList.isNotEmpty && _currentListIndex == 1) {
          showToast(msg: 'Document Submitted', isError: false);
          navigateGoRouterPush(context, AppRouteNames.loginScreen);
          showToast(msg: 'Document Submitted', isError: false);
        } else {
          showToast(msg: 'Fill up the fields', isError: true);
        }
    // return navigatePush(context, const PublishScreen());
    }
    notifyListeners();
  }



  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    for (var part in nameParts) {
      initials += part[0];
    }
    return initials.toUpperCase();
  }

  Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    logger.wtf(appVersion);
    logger.wtf(buildNumber);
    notifyListeners();
  }

  void togglePwdVisibility() {
    _obscurePasswordText = !_obscurePasswordText;
    notifyListeners();
  }

  void toggleConfirmPwdVisibility() {
    _obscureConfirmPwdText = !_obscureConfirmPwdText;
    notifyListeners();
  }

  void toggleOldPwdVisibility() {
    _obscureOldPwdText = !_obscureOldPwdText;
    notifyListeners();
  }

  void toggleCheckerVisibility() {
    _isChecked = !_isChecked;
    // updateRegisterButtonState();
    notifyListeners();
  }

  clearChangePasswordData() {
    _confirmPasswordController.clear();
    _oldPasswordController.clear();
    _newPasswordController.clear();
  }

  saveUserId(localUserId) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Id", localUserId);
    logger.i("saved User Id ${DummyData.userId}");
  }

  getUserId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.userId = sharedPreferences.getString("Id");
    logger.i("get User Id: ${DummyData.userId}");
  }

  void removeImage(int index) {
    if (index >= 0 && index < _identificationImageList.length) {
      _identificationImageList.removeAt(index);
      notifyListeners();
    }
  }
  void resetState() {
    // Reset password visibility states
    _obscurePasswordText = true;
    _obscureConfirmPwdText = true;
    _obscureOldPwdText = true;

    // Reset checkboxes and buttons
    _isChecked = false;
    _buttonChangePwdState = CustomButtonState(
      buttonState: ButtonState.idle,
      text: TTexts.continueText,
    );

    _buttonSubmitKYCState = CustomButtonState(
      buttonState: ButtonState.idle,
      text: TTexts.login,
    );

    // Clear image lists and files
    driversLicenseFrontAndBckImage.clear();
    imageFrontAndBckImage.clear();
    proofOfId = null;
    proofOfAddress = null;
    ninImageFront = null;
    ninImageBack = null;
    intlPassportImageFront = null;
    intlPassportImageBack = null;
    _documentType = null;
    _profileData = null;
    _isSubmittingKYC = false;
    _isUpdatingUserProfile = true;
    _isDeletingUserProfile = true;
    _showUploadIndicator = false;
    _uploadProgress = 0.0;
    _validatePasswordControllers.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailAddressController.clear();
    _phoneNumberController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _bvnController.clear();
    _addressController.clear();

    // Reset bank list

    // Notify listeners to update UI
    notifyListeners();
  }


}
