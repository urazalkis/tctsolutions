import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class JobBusinessDetailModel extends IBaseModel<JobBusinessDetailModel>{
  RegisterModel registerModel;
  String? jobId;



  JobBusinessDetailModel({required this.registerModel,this.jobId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['jobId'] = jobId;
    return data;
  }

  @override
  JobBusinessDetailModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
