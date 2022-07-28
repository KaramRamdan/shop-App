import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Shop_Layout.dart';
import 'package:shop_app/modules/Shop_App/login/cubit/cubit.dart';
import 'package:shop_app/modules/Shop_App/login/cubit/status.dart';
import 'package:shop_app/modules/Shop_App/register/shop_register_Screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (BuildContext context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(
                      key: 'token',
                  value: state.loginModel.data!.token!,

              ).then((value) {
                token = state.loginModel.data!.token!;
                navigateAndFinish(context, ShopLayout());
              });
            } else {
              showToast(
                state: ToastStates.ERROR,
                text: state.loginModel.message!,
              );
            }
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          label: 'Email',
                          controller: emailController,
                          prefix: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            label: 'Password',
                            controller: passwordController,
                            prefix: Icons.lock_outline,
                            type: TextInputType.visiblePassword,
                            suffix: ShopLoginCubit.get(context).suffix,
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            suffixPressed: () {
                              ShopLoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            onValidate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Password can\'t be empty';
                              } else if (value.length < 6) {
                                return 'Password should at lest 6 character';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                              text: 'login',
                              radius: 20,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              isUpperCase: true,
                            );
                          },
                          fallback: (BuildContext context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'don\'t have an account?',
                            ),
                            defaultTextButton(
                                text: 'Register Now',
                                function: () {
                                  navigateTo(
                                    context,
                                    ShopRegisterScreen(),
                                  );
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
