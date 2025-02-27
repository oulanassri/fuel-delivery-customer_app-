// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// class DioHelper {
//   late Dio dio;
//
//
//   init() {
//     dio = Dio(BaseOptions(
//       headers: {
//         'Accept': 'application/json',
//         // "Access-Control-Allow-Origin": "*",
//         // // Required for CORS support to work
//         // "Access-Control-Allow-Credentials": true,
//         // // Required for cookies, authorization headers with HTTPS
//         // "Access-Control-Allow-Headers":
//         //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//         // "Access-Control-Allow-Methods": "POST, OPTIONS"
//       },
//       baseUrl: "http://192.168.163.17:8080",
//       //connectTimeout: Duration(milliseconds: 5000),
//      // receiveTimeout: Duration(milliseconds: 3000),
//     ));
//   }
//
//   void postDataFromApi() async {
//     print("postDataFromApi");
//     try {
//       var response = await dio.post(
//         "/api/Customer/Register",
//         data: {
//           "name": "string16",
//           "password": "string16",
//           "phone": "1122334420",
//           "email": "string20@gmail.com"
//         },
//       );
//
//
//       print("true");
//     } catch (e) {
//       print(e);
//     }
//   }
//
// }
