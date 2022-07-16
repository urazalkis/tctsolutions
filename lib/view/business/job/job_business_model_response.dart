import 'package:motaperp_tctsolutions/core/base/model/base_error.dart';
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';
class JobBusinessResponseModel extends IBaseModel<JobBusinessResponseModel>{
  int? success;
  BaseError? error;
  String? entranceSystemNo;
  String? jobId;
  String? acceptStatus;
  String? jobName;
  String? employeeCount;
  String? dayCount;
  String? startingDate;
  String? completionDate;
  String? startingTime;
  String? completionTime;
  String? explanation;
  JobBusinessResponseModel({this.success,this.error,this.entranceSystemNo,this.jobId,this.acceptStatus,this.jobName,this.employeeCount,this.dayCount,this.startingDate,this.completionDate,this.startingTime
    ,this.completionTime});

  JobBusinessResponseModel.fromJson(Map<String, dynamic> json) {
    error = BaseError();
    success = json['success'] as int?;
    error!.message = json['errorMessage'] as String?;
    entranceSystemNo = json['GirisSistemNo'] as String?;
    jobId = json['IsID'] as String?;
    acceptStatus = json['KabulDurum'] as String?;
    jobName = json['IsTuru'] as String?;
    employeeCount = json['TahsisEdilenElemanSayisi'] as String?;
    dayCount = json['GunSayisi'] as String?;
    startingDate = json['BaslangicTarihi'] as String?;
    completionDate = json['BitisTarihi'] as String?;
    startingTime = json['BaslangicSaati'] as String?;
    completionTime = json['BitisSaati'] as String?;
    explanation = json['Aciklama'] as String?;
  }
  @override
  JobBusinessResponseModel fromJson(Map<String, dynamic> json) {
    return JobBusinessResponseModel.fromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorMessage'] = error!.message;
    return data;
  }
}

