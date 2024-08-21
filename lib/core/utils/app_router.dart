import 'package:go_router/go_router.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/Layouts/home_layout.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/features/home/presentation/views/add_properties_screen.dart';
import 'package:resido_app/features/home/presentation/views/add_properties_second_screen.dart';
import 'package:resido_app/features/home/presentation/views/property_details_screen.dart';
import 'package:resido_app/features/search/presentation/views/filter_screen.dart';
import 'package:resido_app/features/profile/contact_us/presentation/views/contact_us.dart';

import '../../features/authentications/presentation/views/login_screen.dart';
import '../../features/authentications/presentation/views/register_screen.dart';
import '../../features/home/presentation/views/add_proparties_third_screen.dart';
import '../../features/profile/profile_edite/presentation/views/profile_edite_screen.dart';
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
        GoRoute(
          path: kPropertyDetails,
          builder: (context, state) => const PropertyDetailes(),
        )
      ]);
}