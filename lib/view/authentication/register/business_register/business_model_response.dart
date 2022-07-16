import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class BusinessResponseModel extends IBaseModel<BusinessResponseModel>{
  int? success;
  BaseError? error;

  BusinessResponseModel({this.success,this.error});

  BusinessResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    // BaseError.fromJson(json['errorMessage']);
  }
  @override
  BusinessResponseModel fromJson(Map<String, dynamic> json) {
    return BusinessResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    return data;
  }
}

