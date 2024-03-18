import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_app/data/models/library_model.dart';

import '../../utils/constants/app_constants.dart';
import '../response/network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> getAllBookInfo() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");

    try {
      http.Response response = await http.get(uri, headers: {
        "Authorization": "Bearer ${AppConstants.token}",
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        return NetworkResponse(
            data: (jsonDecode(response.body)["items"] as List?)
                    ?.map((e) => BookModel.fromJson(e))
                    .toList() ??
                []);
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> postSchoolInfo(BookModel bookModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");

    try {
      http.Response response = await http.post(uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([bookModel.toJson()]));
      if (response.statusCode == 201) {
        getAllBookInfo();
        return NetworkResponse(data: "School info added SUCCESSFULLY.");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> deleteBookInfo(String uuId) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");

    try {
      http.Response response = await http.delete(uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([
            {"_uuid": uuId}
          ]));
      if (response.statusCode == 200) {
        getAllBookInfo();

        return NetworkResponse(data: "School info deleted SUCCESSFULLY.");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  static Future<NetworkResponse> updateBookInfo(
      BookModel schoolInfoModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");

    try {
      http.Response response = await http.put(uri,
          headers: {
            "Authorization": "Bearer ${AppConstants.token}",
            "Content-Type": "application/json",
          },
          body: jsonEncode([schoolInfoModel.toJsonUpdate()]));
      if (response.statusCode == 200) {
        getAllBookInfo();

        return NetworkResponse(data: "School info updated SUCCESSFULLY.");
      }
      return NetworkResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
