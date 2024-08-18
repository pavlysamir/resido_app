import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/Layouts/home_layout_cubit.dart';

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
                    IconlyLight.chat,
                  ),
                  label: AppLocalizations.of(context)!.chat,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    IconlyLight.profile,
                  ),
                  label: AppLocalizations.of(context)!.profile,
                ),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),

            // BottomAppBar(
            //   clipBehavior: Clip.antiAlias,
            //   notchMargin: 2,
            //   padding: EdgeInsets.zero,
            //   color: Colors.white,
            //   elevation: 0.0,
            //   shape: const CircularNotchedRectangle(),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border(
            //         top: BorderSide(
            //           color: Colors.grey[300]!,
            //           width: 1.0,
            //         ),
            //       ),
            //     ),
            //     child: BottomNavigationBar(
            //       mouseCursor: MouseCursor.defer,
            //       items: [
            //         BottomNavigationBarItem(
            //           icon: const Icon(
            //             IconlyLight.home,
            //           ),
            //           label: AppLocalizations.of(context)!.home,
            //         ),
            //         BottomNavigationBarItem(
            //           icon: const Icon(
            //             IconlyLight.chat,
            //           ),
            //           label: AppLocalizations.of(context)!.chat,
            //         ),
            //         BottomNavigationBarItem(
            //           icon: const Icon(
            //             IconlyLight.profile,
            //           ),
            //           label: AppLocalizations.of(context)!.profile,
            //         ),
            //       ],
            //       currentIndex: cubit.currentIndex,
            //       onTap: (index) {
            //         cubit.changeBottomNavBar(index);
            //       },
            //     ),
            //   ),
            // ),

            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
