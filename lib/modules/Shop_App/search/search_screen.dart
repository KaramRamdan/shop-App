import 'package:flutter/material.dart';
import 'package:shop_app/modules/Shop_App/search/Cubit/cubit.dart';
import 'package:shop_app/modules/Shop_App/search/Cubit/status.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSearchScreen extends StatelessWidget {
  const ShopSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        prefix: Icons.search,
                        controller: searchController,
                        label: 'Search',
                        type: TextInputType.text,
                        onChanged: (value) {
                          onChangedValue(value,context);
                        },
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Write Your Search Hint Word';
                          }
                          return null;
                        }


                        ),
                    SizedBox(height: 20,),
                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(height: 20,),
                    if(state is SearchSuccessState)
                    Expanded(
                        child: ListView.separated(
                          itemBuilder: (context,index)=>
                              buildListProduct(SearchCubit.get(context).model!.data!.data![index],context,isOldPrice: false),
                          separatorBuilder: (context,index)=>
                              myDivider(),
                          itemCount: SearchCubit.get(context).model!.data!.data!.length,
                        ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
void onChangedValue(value,context) {
  SearchCubit.get(context).search(value);
}