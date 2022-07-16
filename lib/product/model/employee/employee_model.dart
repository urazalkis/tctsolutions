import 'package:motaperp_tctsolutions/view/authentication/login/login_model.dart';

class EmployeeModel{
  LoginModel? loginModel;
  String? id;
  String? name;
  String? phone;
  String? profession;
  String? job;
  String? reserveJob;

  EmployeeModel({this.loginModel,this.id,this.name, this.phone, this.profession, this.job, this.reserveJob});
}
