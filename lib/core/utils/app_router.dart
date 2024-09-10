import 'package:go_router/go_router.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/Layouts/home_layout.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/features/authentications/presentation/views/forget_password_screen.dart';
import 'package:resido_app/features/home/presentation/views/add_prop_screens/add_properties_screen.dart';
import 'package:resido_app/features/home/presentation/views/add_prop_screens/add_properties_second_screen.dart';
import 'package:resido_app/features/category_details/ui/views/category_details_screen.dart';
import 'package:resido_app/features/home/presentation/views/feature_prop_screen.dart';
import 'package:resido_app/features/most_like_properties_all/ui/views/most_like_properties_screen.dart';
import 'package:resido_app/features/search/presentation/views/filter_result_screen.dart';
import 'package:resido_app/features/search/presentation/views/filter_screen.dart';
import 'package:resido_app/features/search/presentation/views/serach_result_screen.dart';
import '../../features/authentications/presentation/views/login_screen.dart';
import '../../features/authentications/presentation/views/register_screen.dart';
import '../../features/home/presentation/views/add_prop_screens/add_proparties_third_screen.dart';
import '../../features/profile/contact_us/ui/views/contact_us.dart';
import '../../features/profile/profile_edite/ui/views/profile_edite_screen.dart';
import '../../features/search/presentation/views/search_screen.dart';

abstract class AppRouter {
  static const kWelcomeView = '/';
  static const kOnBording = '/OnBording';
  static const kHomeLayout = '/HomeLayout';
  static const kAddProperties = '/AddProperties';
  static const kAddSecondProperties = '/AddSecondProperties';
  static const kAddThirdProperties = '/AddThirdProperties';
  static const kLoginScreen = '/LoginScreen';
  static const kRegisterScreen = '/RegisterScreen';
  static const kSearchScreen = '/SearchScreen';
  static const kProfileScreen = '/ProfileScreen';
  static const kProfileEditScreen = '/ProfileEditScreen';
  static const kFilterScreen = '/FilterScreen';
  static const kAboutUs = '/AboutUs';
  static const kPropertyDetails = '/PropertyDetails';
  static const kFilterResultsScreen = '/FilterResultsScreen';
  static const kAllFeaturePropScreen = '/AllFeaturePropScreen';
  static const kResetPasswordScreen = '/ResetPasswordScreen';
  static const kSearchResultScreen = '/SearchResultScreen';
  static const kMostLikedProperties = '/MostLikedProperties';
  static const kCateegoryDeatilsScreen = '/CateegoryDeatilsScreen';

  static final router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation:
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.token) ==
                  null
              ? kLoginScreen
              : kHomeLayout,
      routes: [
        GoRoute(
          path: kHomeLayout,
          builder: (context, state) => const HomeLayout(),
        ),
        GoRoute(
            path: kMostLikedProperties,
            builder: (context, state) => MostLikePropertiesScreen()),
        GoRoute(
          path: kAddProperties,
          builder: (context, state) => const AddPropertiesScreen(),
        ),
        GoRoute(
          path: kAddSecondProperties,
          builder: (context, state) => const AddPropertiesSecondScreen(),
        ),
        GoRoute(
          path: kAddThirdProperties,
          builder: (context, state) => const AddPropertiesThirdScreen(),
        ),
        GoRoute(
          path: kLoginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: kRegisterScreen,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: kSearchScreen,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: kProfileEditScreen,
          builder: (context, state) => ProfileEditeScreen(),
        ),
        GoRoute(
          path: kFilterScreen,
          builder: (context, state) => const FilterScreen(),
        ),
        GoRoute(
          path: kAboutUs,
          builder: (context, state) => ContactUs(),
        ),
        // GoRoute(
        //   path: kPropertyDetails,
        //   builder: (context, state) => const PropertyDetailes(),
        // ),
        GoRoute(
          path: kFilterResultsScreen,
          builder: (context, state) => const FilterResultScreen(),
        ),
        GoRoute(
          path: kAllFeaturePropScreen,
          builder: (context, state) => const FeaturePropScreen(),
        ),
        GoRoute(
          path: kResetPasswordScreen,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: kSearchResultScreen,
          builder: (context, state) => const SerachResultScreen(),
        ),
        GoRoute(
          path: kCateegoryDeatilsScreen,
          builder: (context, state) => CategoryDetailsScreen(idOFCategory:state.extra as int),
        )
      ]);
}
