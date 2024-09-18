import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/Layouts/home_layout_cubit.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/core/utils/widgets/custom_botton_sheet_guest.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              mouseCursor: MouseCursor.defer,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    IconlyLight.home,
                  ),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    IconlyLight.heart,
                  ),
                  label: AppLocalizations.of(context)!.favoutires,
                ),
                // BottomNavigationBarItem(
                //   icon: const Icon(
                //     IconlyLight.chat,
                //   ),
                //   label: AppLocalizations.of(context)!.chat,
                // ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    IconlyLight.profile,
                  ),
                  label: AppLocalizations.of(context)!.profile,
                ),
              ],
              currentIndex: token == null ? 0 : cubit.currentIndex,
              onTap: (index) {
                if (getIt
                        .get<CashHelperSharedPreferences>()
                        .getData(key: 'uId') ==
                    null) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    builder: (BuildContext context) {
                      return const CustomBottomSheetGuest();
                    },
                  );
                  ;
                } else {
                  cubit.changeBottomNavBar(index);
                }
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
