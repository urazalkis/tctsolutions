import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/view/authentication/login/login_model.dart';

class ProfileEmployeeModel extends IBaseModel<ProfileEmployeeModel>{
  String? userId;
  LoginModel loginModel;


  ProfileEmployeeModel({required this.loginModel,this.userId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = loginModel.registerModel!.dbName;
    data['db_userName'] = loginModel.registerModel!.dbUserName;
    data['db_password'] = loginModel.registerModel!.dbPassword;
    data['userId'] = userId;
    data['userName'] = loginModel.userName;
    data['password'] = loginModel.password;

    return data;
  }

  @override
  ProfileEmployeeModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
