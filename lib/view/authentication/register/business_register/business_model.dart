import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class BusinessModel extends IBaseModel<BusinessModel>{
  RegisterModel registerModel;
  String? companyName;
  String? authorizedName;
  String? city;
  String? phone;
  String? email;
  BusinessModel({required this.registerModel,this.companyName,this.authorizedName,this.city,this.phone,this.email});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['companyName'] = companyName;
    data['authorizedName'] = authorizedName;
    data['city'] = city;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }

  @override
  BusinessModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
