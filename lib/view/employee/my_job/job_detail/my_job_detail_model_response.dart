import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class MyJobDetailResponseModel extends IBaseModel<MyJobDetailResponseModel>{
  int? success;
  BaseError? error;
  String? date;
  String? startingTime;
  String? completionTime;
  MyJobDetailResponseModel({this.success,this.error});

  MyJobDetailResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    date = json['Zaman'] as String?;
    startingTime = json['GirisSaati'] as String? ?? '';
    completionTime = json['CikisSaati'] as String? ?? '';
  }
  @override
  MyJobDetailResponseModel fromJson(Map<String, dynamic> json) {
    return MyJobDetailResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    data['startingTime'] = success;
    data['completionTime'] = success;
    return data;
  }
}

