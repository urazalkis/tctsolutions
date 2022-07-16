import 'package:motaperp_tctsolutions/view/authentication/login/login_model.dart';

class BusinessModel{
  LoginModel? loginModel;
  String? id;
  String? title;
  String? authorizedName;
  String? phone;
  String? fixedPhone;
  String? email;
  String? address;


  BusinessModel({this.loginModel,this.id,this.title, this.authorizedName, this.phone, this.fixedPhone,this.email, this.address});
}
