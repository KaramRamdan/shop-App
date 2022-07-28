import 'package:shop_app/models/shop_app/change_favorites_model.dart';
import 'package:shop_app/models/shop_app/shop_login_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopChangeThemeModeState extends ShopStates{}

class ShopLoadingHomeState extends ShopStates{}

class ShopSuccessHomeState extends ShopStates{}

class ShopErrorHomeState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriesState extends ShopStates{}

class ShopSuccessChangeFavoritesState extends ShopStates
{
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopChangeFavoritesState extends ShopStates{}

class ShopErrorChangeFavoritesState extends ShopStates{}

class ShopSuccessGetFavoritesState extends ShopStates{}

class ShopErrorGetFavoritesState extends ShopStates{}

class ShopLoadingGetFavoritesState extends ShopStates{}

class ShopSuccessUserDataState extends ShopStates{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates{}

class ShopLoadingUserDataState extends ShopStates{}

class ShopSuccessUpdateUserState extends ShopStates{
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates{}

class ShopLoadingUpdateUserState extends ShopStates{}
