import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class JobEmployeeResponseModel extends IBaseModel<JobEmployeeResponseModel>{
  int? success;
  BaseError? error;
  String? entranceSystemNo;
  String? jobId;
  String? jobName;
  String? company;
  String? dayCount;
  String? startingDate;
  String? completionDate;
  String? startingTime;
  String? completionTime;
  JobEmployeeResponseModel({this.success,this.error,this.entranceSystemNo,this.jobId,this.jobName,this.company,this.dayCount,this.startingDate,this.completionDate,this.startingTime
    ,this.completionTime});

  JobEmployeeResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    entranceSystemNo = json['GirisSistemNo'] as String?;
    jobId = json['IsID'] as String?;
    jobName = json['IsTuru'] as String?;
    company = json['Unvan'] as String?;
    dayCount = json['GunSayisi'] as String?;
    startingDate = json['BaslangicTarihi'] as String?;
    completionDate = json['BitisTarihi'] as String?;
    startingTime = json['BaslangicSaati'] as String?;
    completionTime = json['BitisSaati'] as String?;
  }
  @override
  JobEmployeeResponseModel fromJson(Map<String, dynamic> json) {
    return JobEmployeeResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    return data;
  }
}

