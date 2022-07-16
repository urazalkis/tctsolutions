import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class EmployeeModel extends IBaseModel<EmployeeModel>{
  RegisterModel registerModel;
  String? name;
  String? email;
  String? phone;
  String? profession;
  String? explanation;
  String? availableJobId;


  EmployeeModel({required this.registerModel,this.name,this.email,this.phone,this.profession,this.explanation,required this.availableJobId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['name'] = name ?? "";
    data['email'] = email ?? "";
    data['phone'] = phone ?? "";
    data['profession'] = profession ?? "";
    data['explanation'] = explanation ?? "";
    data['availableJobId'] = availableJobId;

    return data;
  }

  @override
  EmployeeModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
