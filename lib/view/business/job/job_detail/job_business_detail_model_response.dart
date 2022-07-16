import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
import 'package:motaperp_tctsolutions/product/model/employee/employee_model.dart';
class JobBusinessDetailResponseModel extends IBaseModel<JobBusinessDetailResponseModel>{
  int? success;
  BaseError? error;
  EmployeeModel? employeeModel;
  JobBusinessDetailResponseModel({this.success,this.error,this.employeeModel});

  JobBusinessDetailResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    employeeModel = EmployeeModel();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    employeeModel!.id = json['PersonelID'] as String?;
    employeeModel!.name = json['AdSoyad'] as String?;
    employeeModel!.phone = json['GSM'] as String?;
    employeeModel!.profession = json['Meslek'] as String?;
  }
  @override
  JobBusinessDetailResponseModel fromJson(Map<String, dynamic> json) {
    return JobBusinessDetailResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    data['ID'] = employeeModel!.id;
    data['AdSoyad'] = employeeModel!.name;
    data['GSM'] = employeeModel!.phone;
    data['Meslek'] = employeeModel!.profession;
    return data;
  }
}

