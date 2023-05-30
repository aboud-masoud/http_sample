import 'package:dio/dio.dart';

enum RequestType { get, post }

class HttpRepository {
  Future<dynamic> callRequest(
      {required RequestType requestType,
      required String methodName,
      Map<String, dynamic> queryParam = const {},
      String language = "en"}) async {
    Response? respose;

    String baseURL = "https://www.helpera.app/";

    Dio dioClient = Dio()
      ..options = BaseOptions(
          baseUrl: baseURL,
          followRedirects: false,
          validateStatus: (status) {
            return true;
          });

    switch (requestType) {
      case RequestType.get:
        respose = await dioClient.get(methodName,
            queryParameters: queryParam,
            options: Options(
              contentType: Headers.jsonContentType,
              headers: {"lang": language}, // This Line can be deleted for other projects
            ));
        break;
      case RequestType.post:
        respose = await dioClient.post(methodName,
            queryParameters: queryParam, options: Options(contentType: Headers.jsonContentType), data: null);
        break;
    }

    return respose.data;
  }
}
