import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class EmployeeBusinessDetailModel extends IBaseModel<EmployeeBusinessDetailModel>{
  RegisterModel registerModel;
  String? jobId;
  String? employeeId;




  EmployeeBusinessDetailModel({required this.registerModel,this.jobId,this.employeeId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['jobId'] = jobId;
    data['employeeId'] = employeeId;
    return data;
  }

  @override
  EmployeeBusinessDetailModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
