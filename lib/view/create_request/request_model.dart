import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/core/constant/text_format/date_format.dart';
import 'package:motaperp_tctsolutions/product/model/register/register_model.dart';

class RequestModel extends IBaseModel<RequestModel>{
  RegisterModel registerModel;
  String? companyName;
  String? authorizedName;
  String? phone;
  String? email;
  String? employeeCount;
  String? startingDate;
  String? completionDate;
  String? startingTime;
  String? completionTime;
  String? explanation;

  RequestModel({required this.registerModel,this.companyName,this.authorizedName,this.phone,this.email,this.employeeCount,this.startingDate,this.completionDate,this.startingTime
  ,this.completionTime,this.explanation});

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['db_name'] = registerModel.dbName;
    data['db_userName'] = registerModel.dbUserName;
    data['db_password'] = registerModel.dbPassword;
    data['companyName'] = companyName;
    data['authorizedName'] = authorizedName;
    data['phone'] = phone;
    data['email'] = email;
    data['employeeCount'] = employeeCount;
    data['startingDate'] = startingDate ?? DateFormatter.instance.date.format(DateTime.parse(DateTime.now().toString()));
    data['completionDate'] = completionDate ?? DateFormatter.instance.date.format(DateTime.parse(DateTime.now().toString()));
    data['startingTime'] = startingTime ?? DateFormatter.instance.time.format(DateTime.parse(DateTime.now().toString()));
    data['completionTime'] = completionTime ?? DateFormatter.instance.time.format(DateTime.parse(DateTime.now().toString()));
    data['explanation'] = explanation;
    return data;
  }

  @override
  RequestModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
