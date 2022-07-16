import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';

class PotentialJobsResponseModel extends IBaseModel<PotentialJobsResponseModel>{
  String? id;
  String? jobName;
  String? wage;
  String? criterion;



  PotentialJobsResponseModel(
  {this.id,this.jobName,this.wage}
      );

   PotentialJobsResponseModel.fromJson(Map<String,dynamic> json){
  id =    json["ID"] as  String? ?? "";
  jobName =    json["IsAdi"] as  String? ?? "";
  wage =    json["GunlukMaas"] as  String? ?? "";
  criterion =    json["Kriterler"] as  String? ?? "";
   }

  @override
  PotentialJobsResponseModel fromJson(Map<String, dynamic> json) {
    return PotentialJobsResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
