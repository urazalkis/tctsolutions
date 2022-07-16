import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class ProfileEmployeeResponseModel extends IBaseModel<ProfileEmployeeResponseModel>{
  int? success;
  BaseError? error;
  int? completedJobHour;
  int? totalJobHour;


  ProfileEmployeeResponseModel({this.success,this.error,this.totalJobHour,this.completedJobHour});

  ProfileEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    completedJobHour = json['completedJobHour'] as int?;
    totalJobHour = json['totalJobHour'] as int?;
  }
  @override
  ProfileEmployeeResponseModel fromJson(Map<String, dynamic> json) {
    return ProfileEmployeeResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    data['success'] = completedJobHour;
    data['success'] = totalJobHour;
    return data;
  }
}

