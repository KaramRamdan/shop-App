// ignore_for_file: file_names
// ignore: file_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Shop_Layout.dart';

import 'package:shop_app/modules/Shop_App/register/cubit/cubit.dart';
import 'package:shop_app/modules/Shop_App/register/cubit/status.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
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
        builder: (context, state) {
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
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          label: 'User Name',
                          controller: nameController,
                          prefix: Icons.person_outline_outlined,
                          type: TextInputType.name,
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
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
                            suffix: ShopRegisterCubit.get(context).suffix,
                            isPassword:
                                ShopRegisterCubit.get(context).isPassword,
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            suffixPressed: () {
                              ShopRegisterCubit.get(context)
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
                          height: 15.0,
                        ),
                        defaultFormField(
                          label: 'Phone',
                          controller: phoneController,
                          prefix: Icons.phone_android_outlined,
                          type: TextInputType.phone,
                          onValidate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter YourPhone Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                              text: 'register',
                              radius: 20,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
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
