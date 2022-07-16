import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class RequestBusinessResponseModel extends IBaseModel<RequestBusinessResponseModel>{
  int? success;
  BaseError? error;

  RequestBusinessResponseModel({this.success,this.error});

  RequestBusinessResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
  }
  @override
  RequestBusinessResponseModel fromJson(Map<String, dynamic> json) {
    return RequestBusinessResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    return data;
  }
}

