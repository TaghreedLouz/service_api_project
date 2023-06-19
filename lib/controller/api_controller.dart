import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:service_api_project/controller/api_mixin.dart';
import 'package:service_api_project/controller/api_settings.dart';
import 'package:service_api_project/model/api_image_respons.dart';
import 'package:service_api_project/model/api_worker_respons.dart';
import 'package:service_api_project/model/order.dart';
import 'package:service_api_project/model/worker.dart';

class ApiController with ApiMixin{


  //login
  Future<ApiRespons> login({email, password}) async {
    Uri uri = Uri.parse(APISettings.login);

    var map = {
      "email": email,
      "password": password,
    };

    http.Response response = await http.post(uri, body: map);

//when url is normal
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiRespons apiResponse = ApiRespons.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        if (apiResponse != null) {
          GetStorage().write("token", apiResponse.data!.token);
          GetStorage().write("email", apiResponse.data!.email);
          GetStorage().write("name", apiResponse.data!.name);
        }
      }
//print("setSearchProduct : "+response.body);
      return apiResponse;
    }
    return faildResponse;
  }




  //register
  Future<ApiRespons> register({required worker workers}) async {
    Uri uri = Uri.parse(APISettings.register);

    http.Response response = await http.post(uri, body: workers.toJsonRegister());

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      ApiRespons apiResponse = ApiRespons.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        if (apiResponse != null) {
          GetStorage().write("token", apiResponse.data!.token);
          GetStorage().write("email", apiResponse.data!.email);
          GetStorage().write("name", apiResponse.data!.name);
        }
      }
//print("setSearchProduct : "+response.body);
      return apiResponse;
    }
    return faildResponse;
  }





  //allService
  Future<dynamic> getAllService() async {
    Uri uri = Uri.parse(APISettings.all_services);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 401) {
      return json.decode(response.body);
    }
  }


  //all order
  Future<dynamic> getAllOrder() async {
    //url
    Uri uri = Uri.parse(APISettings.add_order);
    //method
    http.Response response = await http.post(uri, headers: {"Authorization": "Bearer "+GetStorage().read("token")});

    print(GetStorage().read("token"));
    print(response.statusCode);
    print(response.body);
    //response
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  ///////////////



  uploadImage({path}) async {
    Uri uri = Uri.parse(APISettings.add_order);
    var request = http.MultipartRequest('POST',uri);
    http.MultipartFile file = await http.MultipartFile.fromPath("photo_order", path);
    request.files.add(file);
    request.headers['Authorization'] = "Bearer "+GetStorage().read("token");

    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      var body = await response.stream.transform(utf8.decoder).first;
      return ApiImageRespons.fromJson(jsonDecode(body));
    }
    return faildResponseiMAGE;


  }

  Future<ApiImageRespons> addOrder({required Order order}) async {
    final url = Uri.parse(APISettings.add_order);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read("token")}',
    };
    final body = jsonEncode(order.toJson());

    final response = await http.post(url, headers: headers, body: body);


    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody.toString());
      return ApiImageRespons.fromJson(responseBody);
    } else {
      throw Exception('Failed to add order. Status code: ${response.statusCode}');
    }
  }


  // //addOrder
  // Future<ApiImageRespons> addOrder({required Order order}) async {
  //   Uri url = Uri.parse(APISettings.add_order);
  //
  //   var request = http.MultipartRequest('POST', url);
  //   request.headers[HttpHeaders.authorizationHeader] =
  //   "Bearer ${GetStorage().read("token")}";
  //
  //   request.fields['work_id'] = order.workId.toString();
  //   request.fields['details'] = order.details!;
  //   request.fields['details_address'] = order.detailsAddress!;
  //   request.fields['phone'] = order.phone!;
  //   request.fields['lat'] = order.lat!;
  //   request.fields['long'] = order.long!;
  //
  //   List<http.MultipartFile> imageFiles = [];
  //   for (String path in order.photoOrder!) {
  //     http.MultipartFile imageFile =
  //     await http.MultipartFile.fromPath('photos[]', path);
  //     imageFiles.add(imageFile);
  //   }
  //
  //   request.files.addAll(imageFiles);
  //
  //
  //   var response = await request.send();
  //   print("response code is: ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     var body = await response.stream.transform(utf8.decoder).first;
  //     return ApiImageRespons.fromJson(jsonDecode(body));
  //   }
  //   return faildResponseiMAGE;
  // }

}
