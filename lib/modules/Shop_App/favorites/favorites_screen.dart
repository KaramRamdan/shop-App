
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Cubit/cubit.dart';
import 'package:shop_app/layout/Shop_App/Cubit/status.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) { },
      builder: (context, state) {

        return ConditionalBuilder(
          builder:(context)=> ListView.separated(
            itemBuilder: (context,index)=>
                buildListProduct(ShopCubit.get(context).favoritesModel!.data!.data![index].product,context),
            separatorBuilder: (context,index)=>
                myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: ( context)=>Center(child: CircularProgressIndicator()),
          condition: state is! ShopLoadingGetFavoritesState,
        );
      },
    );
  }

}
