import 'dart:developer';

// import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final baseUrl = 'https://shagaf-bl7b.onrender.com';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    // dio.interceptors.add(ChuckerDioInterceptor());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    log(token);

    dio.options.headers = {'Authorization': "Bearer $token"};
    // dio.options.queryParameters = {'lang': SharedData.getUserLan()};
    final response = await dio.get('$baseUrl$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> deleteData({required String endPoint}) async {
    // dio.interceptors.add(ChuckerDioInterceptor());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    log(token);
    dio.options.headers = {'Authorization': "Bearer $token"};
    // dio.options.queryParameters = {'lang': SharedData.getUserLan()};
    final response = await dio.delete('$baseUrl$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> postData(
      {required String endPoint, required Object? data}) async {
    //dio.interceptors.add(ChuckerDioInterceptor());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    log(token);
    dio.options.headers = {'Authorization': "Bearer $token"};

    final response = await dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> putData(
      {required String endPoint, required Object? data}) async {
    // dio.interceptors.add(ChuckerDioInterceptor());
    //
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    log(token);
    dio.options.headers = {'Authorization': "Bearer $token"};

    final response = await dio.put('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> patchData(
      {required String endPoint, required Object? data}) async {
    // dio.interceptors.add(ChuckerDioInterceptor());
    //
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token") ?? "";
    log(token);
    dio.options.headers = {'Authorization': "Bearer $token"};

    final response = await dio.patch('$baseUrl$endPoint', data: data);
    return response.data;
  }
}
