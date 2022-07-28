
import 'package:flutter/material.dart';
import 'package:shop_app/layout/Shop_App/Cubit/cubit.dart';
import 'package:shop_app/layout/Shop_App/Cubit/status.dart';
import 'package:shop_app/models/shop_app/categroies_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        listener:(context,state){},
        builder: (context,state){
          return ListView.separated(
            itemBuilder: (context,index)=>
                buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data![index]),
            separatorBuilder: (context,index)=>
                myDivider(),
            itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length,
          );
        },
       );
  }
  Widget buildCatItem(DataModel model)=>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image:NetworkImage(model.image!),
              height:120.0 ,
              width: 120.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      );
}
