import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class EmployeeResponseModel extends IBaseModel<EmployeeResponseModel>{
  int? success;
  BaseError? error;

  EmployeeResponseModel({this.success,this.error});

  EmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    // BaseError.fromJson(json['errorMessage']);
  }
  @override
  EmployeeResponseModel fromJson(Map<String, dynamic> json) {
    return EmployeeResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    return data;
  }
}

