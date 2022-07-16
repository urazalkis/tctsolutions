import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class MyJobDetailModel extends IBaseModel<MyJobDetailModel>{
  RegisterModel registerModel;
  String? jobId;
  String? employeeId;
  String? qrNo;



  MyJobDetailModel({required this.registerModel,this.jobId,this.employeeId,this.qrNo});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['jobId'] = jobId;
    data['employeeId'] = employeeId;
    data['qrNo'] = qrNo;
    return data;
  }

  @override
  MyJobDetailModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
