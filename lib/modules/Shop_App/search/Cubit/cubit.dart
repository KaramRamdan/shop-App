import 'package:shop_app/models/shop_app/search_model.dart';
import 'package:shop_app/modules/Shop_App/search/Cubit/status.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/Dio_Helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  void search(String? text) {
    emit(SearchLoadingState());
    DioHelper.postData(
        token: token,
        url: SEARCH,
        data: {
          'text':text,
        }
    ).then((value) {
      model=SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
