class ShopLoginModel
{
  bool? status;
  String? message;
 UserData? data;
 ShopLoginModel.fromJson(Map<String,dynamic> json)
 {
  status=json['status'];
  message=json['message'];
  if (json['data']!=null) {
   data = json['data']!=null?UserData.fromJson(json['data']):null;
  }
 }
}
class UserData
{
 dynamic id;
 dynamic name;
 dynamic email;
 dynamic phone;
 String? image;
 int? points;
 int? credit;
 String? token;

  UserData.fromJson(Map<String,dynamic> json)
 {
id=json['id'];
name=json['name'];
email=json['email'];
phone=json['phone'];
image=json['image'];
points=json['points'];
credit=json['credit'];
token=json['token'];

 }
}