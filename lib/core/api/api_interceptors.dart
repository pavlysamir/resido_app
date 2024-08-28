import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';

import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';

import '../utils/service_locator.dart';
import 'end_ponits.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get the token from SharedPreferences

    String apiKey = 'base64:vDsGZjXJlDcXVKkrV3xYe8xUiL6TMf5D6Pqf6QPSw5c=';

    String? token =
        getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);
    print('token: $token');

    // If token is not null, add it to the request headers as a Bearer token
    options.headers['APP_KEY'] = apiKey;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Check for token expiration in the www-authenticate header
      if (err.response?.headers.value('www-authenticate') != null &&
          err.response!.headers
              .value('www-authenticate')!
              .contains('invalid_token')) {
        // Token is expired, navigate to login screen
        // navigatorKey.currentState?.pushReplacementNamed();
        customGoAndDeleteNavigate(
            context: navigatorKey.currentState!.context,
            path: AppRouter.kLoginScreen);
      }
    }
    super.onError(err, handler);
  }
}
