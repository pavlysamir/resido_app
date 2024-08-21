import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/functions/validation_handling.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/styles.dart';
import 'package:resido_app/core/utils/widgets/custom_button_large.dart';
import 'package:resido_app/core/utils/widgets/custom_form_field.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/authentications/presentation/managers/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Form(
          key: RegisterCubit.get(context)!.formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Image.asset(
                      AssetsData.logo,
                      height: 73,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),

                    Text(
                      AppLocalizations.of(context)!.signUp,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // Text(AppLocalizations.of(context)!.createAccount,
                    //     style: Styles.textStyle14Grey
                    //         .copyWith(color: Colors.black)),
                    SizedBox(height: 30.h),
                    CustomFormField(
                        textInputType: TextInputType.emailAddress,
                        hintText: AppLocalizations.of(context)!.email,
                        controller: RegisterCubit.get(context)!.emailController,
                        validationMassage: conditionOfValidationEmail),
                    SizedBox(height: 30.h),
                    CustomFormField(
                        textInputType: TextInputType.text,
                        hintText: AppLocalizations.of(context)!.name,
                        controller: RegisterCubit.get(context)!.nameController,
                        validationMassage: conditionOfValidationName),
                    SizedBox(height: 30.h),
                    CustomFormField(
                        isEyeTrue:
                            RegisterCubit.get(context)!.ifPasswordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            RegisterCubit.get(context)!.isVisiblePasswordEye();
                          },
                          icon: Icon(
                              size: 18,
                              color: Colors.grey,
                              RegisterCubit.get(context)!.iconDataPassword),
                        ),
                        textInputType: TextInputType.visiblePassword,
                        hintText: AppLocalizations.of(context)!.password,
                        controller:
                            RegisterCubit.get(context)!.passwordController,
                        validationMassage: conditionOfValidationPassWord),
                    SizedBox(height: 30.h),
                    CustomFormField(
                      isEyeTrue:
                          RegisterCubit.get(context)!.ifConfirmPasswordVisible,
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          RegisterCubit.get(context)!
                              .isVisibleConformPasswordEye();
                        },
                        icon: Icon(
                            size: 18,
                            RegisterCubit.get(context)!
                                .iconDataConfirmPassword),
                      ),
                      textInputType: TextInputType.visiblePassword,
                      hintText: AppLocalizations.of(context)!.confirmPassword,
                      controller:
                          RegisterCubit.get(context)!.confirmPasswordController,
                      validationMassage: (value) {
                        if (value ==
                            RegisterCubit.get(context)!
                                .passwordController
                                .text) {
                          return null;
                        } else {
                          return 'does\'t match ';
                        }
                      },
                    ),
                    SizedBox(height: 30.h),
                    // state is SignUpLoading
                    //     ? const Center(
                    //         child: CircularProgressIndicator(
                    //           color: kPrimaryKey,
                    //         ),
                    //       )
                    //     :
                    CustomButtonLarge(
                      function: () {
                        if (RegisterCubit.get(context)!
                            .formKey
                            .currentState!
                            .validate()) {
                          // RegisterCubit.get(context)!.signUp();
                        }
                      },
                      text: AppLocalizations.of(context)!.signUp,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       AppLocalizations.of(context)!.t,
                    //     ),
                    //     const SizedBox(
                    //       width: 1,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(context,
                    //             MaterialPageRoute(builder: (context) {
                    //           return TermsAndConditionsScreen();
                    //         }));
                    //       },
                    //       child: Text(
                    //           AppLocalizations.of(context)!.termsAndConditions,
                    //           style: Styles.textStyle14Orange),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          customGoAndDeleteNavigate(
                              context: context, path: AppRouter.kLoginScreen);
                        },
                        child: Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                            style: Styles.textStyle12Orange.copyWith(
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
