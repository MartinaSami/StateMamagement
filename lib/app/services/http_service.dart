import "package:dio/dio.dart";
import 'package:flutter/foundation.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';

import '../exceptions/ExceptionHandler.dart';
import '../exceptions/exceptions.dart';

import 'loading_overlay_service.dart';

class HttpService {
  static const BASE_URL_API_DEV = "";
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL_API_DEV,
    connectTimeout: 30000,
    receiveTimeout: 20000,
    headers: {
      "Accept": "application/json",
    },
  );
  Dio _dio = Dio(baseOptions);
  Dio get client => _dio;

  void setupDio(BaseOptions options) {
    baseOptions = options;
  }

  final loadingOverlay = locator<LoadingOverlay>();

  HttpService() {
    if (kReleaseMode) {
      _dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true),
      );
    }

    _dio.interceptors.add(
      InterceptorsWrapper(onError: (DioError e, handler) {
        try {
          if (DioErrorType.response == e.type) {
            switch (e.response?.statusCode) {
              case 422:
                throw ValidationException(e.response?.data["errors"]);
                break;
              case 401:
                throw AuthenticationException(e.response?.data["message"]);
                break;
              case 403:
                throw AuthorizationException("غير مصرح لك");
                break;
              case 400:
                throw BadrequestException(e.response?.data["message"]);
              default:
                throw e.error;
                break;
            }
          } else if (DioErrorType.connectTimeout == e.type) {
            throw ConnectionException(
              "لا يوجد اتصال بالانترنت تحقق من اتصالك وحاول مره اخري",
            );
          }
        } catch (e) {
          ExceptionHandler(
            context: StackedService.navigatorKey!.currentContext!,
            error: e,
          );
          return handler.next(e as DioError);
        }
      }),
    );
  }
}
