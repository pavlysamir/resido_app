import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/styles.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:resido_app/features/authentications/presentation/managers/login_cubit/login_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Form(
                  key: LoginCubit.get(context)!.formVerifyEmailForgetOtpKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(AppLocalizations.of(context)!.resetPassWord,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 20,
                                )),
                      ),
                      SizedBox(
                        height: 44.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.forgetpass,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        AppLocalizations.of(context)!.noWorry,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 40.h),
                      CustomFormField(
                        controller:
                            LoginCubit.get(context)!.emailToResetPassword,
                        hintText: AppLocalizations.of(context)!.yourEmail,
                        textInputType: TextInputType.emailAddress,
                        validationMassage: (value) {
                          if (value.isEmpty) {
                            return 'please enter new email';
                          }
                        },
                      ),
                      SizedBox(height: 60.h),
                      CustomButtonLarge(
                          text: AppLocalizations.of(context)!.signUp,
                          textColor: AppColors.white,
                          function: () {
                            if (LoginCubit.get(context)!
                                .formVerifyEmailForgetOtpKey
                                .currentState!
                                .validate()) {}
                          }),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.backTo,
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              customGoAndDeleteNavigate(
                                  context: context,
                                  path: AppRouter.kLoginScreen);
                              //LoginCubit.get(context)!.clearData();
                            },
                            child: Text(AppLocalizations.of(context)!.login,
                                style: Styles.textStyle16Black.copyWith(
                                  color: AppColors.primaryColor,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
