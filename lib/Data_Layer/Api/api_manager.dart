import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_constants.dart';
import 'package:e_commerce/Data_Layer/Model/Request/Register_request.dart';
import 'package:e_commerce/Data_Layer/Model/Request/login_request.dart';
import 'package:e_commerce/Data_Layer/Model/Response/auth_response_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/category_brand_response_dto.dart';
import 'package:http/http.dart' as http;

import '../../Domain_Layer/Entities/failures_entity.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _apiManager;

  static ApiManager getInstance() {
    _apiManager ??= ApiManager._();
    return _apiManager!;
  }

  Future<Either<Failures, AuthResponseDto>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);

      var registerRequest = RegisterRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          AuthResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AuthResponseDto>> login(
      String email, String password) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
      var loginRequest = LoginRequest(email: email, password: password);

      var response = await http.post(url, body: loginRequest.toJson());

      var loginResponse = AuthResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoriesApi);

      var response = await http.get(url);

      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandsApi);

      var response = await http.get(url);

      var categoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
