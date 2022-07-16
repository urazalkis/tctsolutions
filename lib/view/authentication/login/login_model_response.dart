import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';


class LoginModelResponse extends IBaseModel<LoginModelResponse>{

  int? success;
  BaseError? error;
  String? id;
  String? userName;
  String? password;
  String? admin;
  String? departmentId;
  String? title;
  String? authorizedName;
  String? phoneCompany;
  String? phoneEmployee;
  String? profession;
  String? city;
  String? type;
  String? userId;
  String? jobId;
  String? jobAcceptStatus;
  String? reserveJobId;


  LoginModelResponse({this.success,this.userName,this.password,this.admin,this.departmentId,this.title,this.authorizedName,this.phoneCompany,this.phoneEmployee,
    this.profession,this.city, this.type,this.userId,this.jobId,this.jobAcceptStatus,this.reserveJobId,this.error});


  LoginModelResponse.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    id = json['ID'] as String?;
    userName = json['userName'] as String?;
    password = json['password'] as String?;
    admin = json['admin'] as String?;
    departmentId = json['departmentId'] as String?;
    title = json['title'] as String?;
    authorizedName = json['authorizedName'] as String?;
    phoneCompany = json['companyPhone'] as String?;
    phoneEmployee = json['employeePhone'] as String?;
    profession = json['profession'] as String?;
    city = json['city'] as String?;
    type = json['type'] as String?;
    userId = json['userId'] as String?;
    jobId = json['jobId'] as String?;
    jobAcceptStatus = json['jobAccessStatus'] as String?;
    reserveJobId = json['reserveJobId'] as String?;
    error!.message = json['errorMessage'] as String?;
  }
  @override
  LoginModelResponse fromJson(Map<String, dynamic> json) {
    return LoginModelResponse.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['admin'] = admin;
    data['departmentId'] = departmentId;
    data['errorMessage'] = error!.message;
    data['name'] = title;
    data['type'] = type;
    data['userId'] = userId;
    return data;
  }



}
