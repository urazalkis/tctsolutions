import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';

class DepartmentResponseModel extends IBaseModel<DepartmentResponseModel>{
  String? id;
  String? status;
  String? department;



  DepartmentResponseModel(
  {this.id,this.status,this.department}
      );

   DepartmentResponseModel.fromJson(Map<String,dynamic> json){
  id =    json["ID"] as  String? ?? "";
  status =    json["Durum"] as  String? ?? "";
  department =    json["DepartmanAdi"] as  String? ?? "";
   }

  @override
  DepartmentResponseModel fromJson(Map<String, dynamic> json) {
    return DepartmentResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
