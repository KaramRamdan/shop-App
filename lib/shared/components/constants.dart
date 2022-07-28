import 'package:shop_app/modules/Shop_App/login/shop_login_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import 'components.dart';

 void signOut(context){
   CacheHelper.removeData(key:'token',
   ).then((value){
     if(value){
       navigateAndFinish(context,ShopLoginScreen());
     }
   });
 }
 void printFullText(String text)
 {
   final pattern =RegExp('.{1,800}');
   pattern.allMatches(text).forEach((match)=>print(match.group(0)));
 }

String? token='';