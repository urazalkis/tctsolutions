import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class JobEmployeeModel extends IBaseModel<JobEmployeeModel>{
  RegisterModel registerModel;
  String? userId;
  String? jobId;

  JobEmployeeModel({required this.registerModel,this.userId,this.jobId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['userId'] = userId;
    data['jobId'] = jobId;
    return data;
  }

  @override
  JobEmployeeModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
