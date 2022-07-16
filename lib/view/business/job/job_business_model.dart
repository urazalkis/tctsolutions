import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class JobBusinessModel extends IBaseModel<JobBusinessModel>{
  RegisterModel registerModel;
  String? status;
  String? acceptStatus;
  String? userId;


  JobBusinessModel({required this.registerModel,this.status,this.acceptStatus,this.userId});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['status'] = status;
    data['acceptStatus'] = acceptStatus;
    data['userId'] = userId;
    return data;
  }

  @override
  JobBusinessModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
