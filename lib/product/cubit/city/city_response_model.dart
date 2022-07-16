import 'package:motaperp_tctsolutions/core/base/model/base_model.dart';

class CityResponseModel extends IBaseModel<CityResponseModel>{
  String? id;
  String? city;
  String? plate;



  CityResponseModel(
  {this.id,this.city,this.plate}
      );

   CityResponseModel.fromJson(Map<String,dynamic> json){
  id =    json["ID"] as  String? ?? "";
  city =    json["SehirAdi"] as  String? ?? "";
  plate =    json["Plaka"] as  String? ?? "";
   }

  @override
  CityResponseModel fromJson(Map<String, dynamic> json) {
    return CityResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  }
