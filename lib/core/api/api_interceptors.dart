import 'package:dio/dio.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get the token from SharedPreferences

    String apiKey = 'base64:7+4+S0ntVJXJgJWh8A1axdkJZuNRGfJZOu2pDL1zloA=';

    // String? token =
    //     getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token);
    // if (kDebugMode) {
    //   print('token: $token');
    // }

    // If token is not null, add it to the request headers as a Bearer token
    options.headers['APP_KEY'] = apiKey;

    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

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
