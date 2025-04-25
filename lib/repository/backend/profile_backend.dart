// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';
import 'package:music_minds/model/local/dummy_data.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart';
import 'package:music_minds/repository/services/api/api_service.dart';
import 'package:music_minds/src/utils.dart';

class ProfileBackend extends ApiService {
  Future<dynamic> getProfileData() async {
    return getMth(getProfileUri, headers: apiHeaderWithToken());
  }

  Future<dynamic> updateUserProfile({
    required String phoneNumber,
    required String username,
  }) async {
    return putMth(
      updateUserProfileUri,
      headers: apiHeaderWithToken(),
      body: {
        "phone": DummyData.phoneNumber,
        "username": username,
      },
    );
  }

  Future<dynamic> deleteProfile() async {
    return deleteMth(
      deleteUserProfileUri,
      headers: apiHeaderWithToken(),
    );
  }

  Future<dynamic> checkUsernameAvailability({required String username}) async {
    return getMth(checkUsernameAvailabilityUri(username: username),
        headers: apiHeaderWithToken());
  }




  Future<dynamic> submitKYC({
    required String bvn,
    required String address,
    required File proofOfAddress,
    required File proofOfId,
    // List<File?>? attachments,
  }) async {
    List<MultipartFile>? fileItems = [];
    //
    // if (attachments != null) {
    //   for (File? file in attachments) {
    //     if (file != null) {
    //       String fileName = file.path.split('/').last;
    //       fileItems.add(await MultipartFile.fromFile(
    //         file.path,
    //         filename: fileName,
    //       ));
    //     }
    //   }
    // }
    // Add proofOfAddress and proofOfId to the fileItems list
    fileItems.add(await MultipartFile.fromFile(
      proofOfAddress.path,
      filename: proofOfAddress.path.split('/').last,
    ));

    fileItems.add(await MultipartFile.fromFile(
      proofOfId.path,
      filename: proofOfId.path.split('/').last,
    ));
    return uploadMth(
      submitKYCUri,
      data: FormData.fromMap({
        'bvn': bvn,
        'address': address,
        'proofOfAddress': await MultipartFile.fromFile(proofOfAddress.path,
            filename: proofOfAddress.path.split('/').last),
        'proofOfIdentification': await MultipartFile.fromFile(proofOfId.path,
            filename: proofOfId.path.split('/').last),
      }),
      headers: apiHeaderWithToken(),
    );
  }

  Future<dynamic> uploadProfileAvatar(
    BuildContext context, {
    required void Function(int, int) onSendProgress,
  }) async {
    dynamic uploadResponse;
    await UtilFunctions.pickImage().then((value) async {
      // selected image file
      final imageFile = value;

      Uint8List? uint8List;

      await imageFile!.readAsBytes().then((value) => uint8List = value);

      final intList = uint8List!.toList();

      //format image file
      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(
          intList,
          filename: imageFile.name,
          contentType: MediaType('image', 'png'),
        ),
      });

      await putUploadMth(
        updateUserProfileImageUri,
        // context: context,
        data: formData,
        onSendProgress: onSendProgress,
        headers: apiHeaderWithToken(),
      ).then((value) {
        if (value != null) {
          uploadResponse = value;
        }
      });
    });
    return uploadResponse;
  }
}
