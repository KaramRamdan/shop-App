import 'package:flutter/material.dart';
import 'package:shop_app/models/shop_app/shop_login_model.dart';
import 'package:shop_app/modules/Shop_App/login/cubit/status.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/Dio_Helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;
  void userLogin( {
  required String email,
  required String password,
})
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,

        },
    ).then((value){
    loginModel=ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error);
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility(){
    isPassword=!isPassword;
    suffix=isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
 emit(ShopChangePasswordVisibilityState());
  }
}
