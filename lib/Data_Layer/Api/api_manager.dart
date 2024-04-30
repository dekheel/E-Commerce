import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data_Layer/Api/api_constants.dart';
import 'package:e_commerce/Data_Layer/Model/Request/Register_request.dart';
import 'package:e_commerce/Data_Layer/Model/Request/login_request.dart';
import 'package:e_commerce/Data_Layer/Model/Response/add_cart_response_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/add_remove_product_favorite_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/auth_response_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/category_brand_response_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/get_cart_response_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/get_favorite_product_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/get_user_dto.dart';
import 'package:e_commerce/Data_Layer/Model/Response/product_response_dto.dart';
import 'package:e_commerce/Ui_Layer/Utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Domain_Layer/Entities/failures_entity.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _apiManager;

  static ApiManager getInstance() {
    _apiManager ??= ApiManager._();
    return _apiManager!;
  }

  Future<Either<Failures, GetFavoriteProductDto>> getFavoriteProduct() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.wishList);
      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response = await http.get(url, headers: {"token": token.toString()});

      var favoriteResponse =
          GetFavoriteProductDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(favoriteResponse);
      } else {
        return Left(ServerError(errorMessage: favoriteResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
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

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productsApi);

      var response = await http.get(url);

      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AddCartResponseDto>> addProductToCart(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addProductApi);

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);
      var response = await http.post(url,
          body: {"productId": productId}, headers: {"token": token.toString()});

      var addCartResponseDto =
          AddCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addCartResponseDto);
      } else {
        return Left(ServerError(errorMessage: addCartResponseDto.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addProductApi);

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response = await http.get(url, headers: {"token": token.toString()});

      var cartResponse = GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteCartItem(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addProductApi}/$productId");

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response =
          await http.delete(url, headers: {"token": token.toString()});

      var cartResponse = GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCartItem(
      String productId, count) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addProductApi}/$productId");

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response = await http.put(url,
          headers: {"token": token.toString()},
          body: {"count": count.toString()});

      var cartResponse = GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, GetUserDto>> getUserData() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      var userEmail =
          SharedPreference.readData(key: SharedPreference.userEmail);

      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getUserApi,
          {SharedPreference.userEmail: userEmail});

      var response = await http.get(url);

      var userResponse = GetUserDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(userResponse);
      } else {
        return Left(ServerError(errorMessage: userResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AddRemoveProductFavoriteDto>> addRemoveFavorite(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri addUrl = Uri.https(ApiConstants.baseUrl, ApiConstants.wishList);

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response = await http.post(addUrl,
          headers: {"token": token.toString()}, body: {"productId": productId});
      // } else {
      //   response = await http.delete(
      //     addUrl,
      //     headers: {"token": token.toString()},
      //   );
      // }

      var wishListResponse =
          AddRemoveProductFavoriteDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(wishListResponse);
      } else {
        return Left(ServerError(errorMessage: wishListResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }

  Future<Either<Failures, AddRemoveProductFavoriteDto>> removeFavorite(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet ||
        connectivityResult == ConnectivityResult.bluetooth ||
        connectivityResult == ConnectivityResult.vpn) {
      Uri removeUrl = Uri.https(
        ApiConstants.baseUrl,
        "${ApiConstants.wishList}/$productId",
      );

      var token = SharedPreference.readData(key: SharedPreference.userTokenKey);

      var response = await http.delete(removeUrl,
          headers: {"token": token.toString()}, body: {"productId": productId});

      var wishListResponse =
          AddRemoveProductFavoriteDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(wishListResponse);
      } else {
        return Left(ServerError(errorMessage: wishListResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check internet connection'));
    }
  }
}
