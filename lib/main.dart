import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Shop_Layout.dart';
import 'package:shop_app/modules/Shop_App/login/shop_login_screen.dart';
import 'package:shop_app/modules/Shop_App/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/block_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/Dio_Helper.dart';
import 'package:shop_app/shared/styles/Themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/Shop_App/Cubit/cubit.dart';
import 'layout/Shop_App/Cubit/status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = onBoardingScreen();
  }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopCubit()
          ..getUserData()
         ,
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  title: 'Shop App',
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: ThemeMode.light,
                  home: startWidget);
            }));
  }
}
