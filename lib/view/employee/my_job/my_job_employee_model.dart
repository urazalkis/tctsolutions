import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class MyJobEmployeeModel extends IBaseModel<MyJobEmployeeModel>{
  RegisterModel registerModel;
  String? status;
  String? acceptStatus;
  String? userId;
  String? jobId;
  String? reservedJobId;


  MyJobEmployeeModel({required this.registerModel,this.status,this.acceptStatus,this.userId,this.jobId,this.reservedJobId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['status'] = status;
    data['acceptStatus'] = acceptStatus;
    data['userId'] = userId;
    data['jobId'] = jobId;
    data['reservedJobId'] = reservedJobId;
    return data;
  }

  @override
  MyJobEmployeeModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
