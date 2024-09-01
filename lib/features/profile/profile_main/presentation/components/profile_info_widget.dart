import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_go_navigator.dart';
import '../controller/profile_cubit.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {

          var email = ProfileCubit.get(context).email;
          var name =ProfileCubit.get(context).name;
          return GestureDetector(
            onTap: () {
              customJustGoNavigate(
                  context: context, path: AppRouter.kProfileEditScreen);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 59.0,
                    height: 59.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.grey,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: 50.0,
                  )
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email ?? "",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}