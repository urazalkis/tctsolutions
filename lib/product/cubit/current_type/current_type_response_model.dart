
import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';

class CurrentTypeResponseModel extends IBaseModel<CurrentTypeResponseModel>{
  String? id;
  String? status;
  String? CurrentType;



  CurrentTypeResponseModel(
  {this.id,this.status,this.CurrentType}
      );

   CurrentTypeResponseModel.fromJson(Map<String,dynamic> json){
  id =    json["ID"] as  String? ?? "";
  status =    json["Durum"] as  String? ?? "";
  CurrentType =    json["CariTuru"] as  String? ?? "";
   }

  @override
  CurrentTypeResponseModel fromJson(Map<String, dynamic> json) {
    return CurrentTypeResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
