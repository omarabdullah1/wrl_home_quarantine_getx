// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:products_youtube/database/models/user_model.dart';
// class AuthServices{
//   static String baseApi = 'http://192.168.1.3:8000/api/auth/user';
//   static var client = http.Client();
//
//   static login({username,password})async{
//     var response =await client.post
//         (Uri.parse('$baseApi/login'),
//         body: jsonEncode(<dynamic,dynamic>{'username':username ,'password':password}),
//     );
//     if(response.statusCode == 200||response.statusCode == 201){
//       var stringObject =response.body;
//       var user= userFromJson(stringObject);
//       return user;
//     }
//     else{
//       return null;
//     }
//   }
// }




import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper {
  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.103:8000/api/auth/user/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    String token,
  }) async
  {
    // dio.options.headers =
    // {
    //   // 'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };

    return dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String token,
  }) async
  {
    dio.options.headers =
    {
      'Authorization': 'Bearer ' + token??'',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}