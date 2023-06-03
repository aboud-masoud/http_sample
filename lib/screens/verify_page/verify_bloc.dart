import 'package:flutter/material.dart';
import 'package:http_sample/model/auth_debug_request.dart';
import 'package:http_sample/utils/http_repository.dart';

class VerifyBloc {
  TextEditingController controller = TextEditingController();

  Future<void> callRequest() async {
    final response = await HttpRepository().callRequest(
      requestType: RequestType.post,
      methodName: "client-auth-verify",
      postBody: VerifyOTPrequest(
          appVersion: '1.0',
          osType: "iOS",
          osVersion: "",
          deviceTypeName: "iPhone 6",
          countryId: 1,
          mobileNumber: "00962795190663",
          userId: 1,
          apiKey: "00101",
          otp: controller.text),
    );

    print(response);
  }
}
