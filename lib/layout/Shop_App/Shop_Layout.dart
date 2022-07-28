// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Cubit/cubit.dart';
import 'package:shop_app/layout/Shop_App/Cubit/status.dart';
import 'package:shop_app/modules/Shop_App/search/search_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()
        ..getUserData()
        ..getHomeData()
        ..getCategories()
        ..getFavorites(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Shop'),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, ShopSearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),

              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottom(index);
              },
              items: cubit.bottomItem,
            ),
          );
        },
      ),
    );
  }
}
