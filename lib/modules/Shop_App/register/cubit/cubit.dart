import 'package:flutter/material.dart';
import 'package:shop_app/models/shop_app/shop_login_model.dart';
import 'package:shop_app/modules/Shop_App/register/cubit/status.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/Dio_Helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error);
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordIconState());
  }
}
