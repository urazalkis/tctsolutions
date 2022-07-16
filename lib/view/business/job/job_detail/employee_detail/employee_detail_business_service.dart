import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'employee__detail_model.dart';
import 'employee_detail_model_response.dart';

abstract class  IEmployeeBusinessDetailService{
  Future<dynamic> fetchEmployeeDetailResponse(EmployeeBusinessDetailModel model,EmployeeBusinessDetailResponseModel responseModel);
}

class EmployeeBusinessDetailService implements IEmployeeBusinessDetailService{
  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;



  Future<dynamic> fetchEmployeeDetailResponse(EmployeeBusinessDetailModel model,EmployeeBusinessDetailResponseModel responseModel) async {

    final response = await networkManager!.responseList<EmployeeBusinessDetailModel,EmployeeBusinessDetailResponseModel>(model, responseModel, UrlService.instance.employeeDetailBusinessUrl);
      print("gelen response data:${response.data ?? "null"}");
      return response.data;


  }
}