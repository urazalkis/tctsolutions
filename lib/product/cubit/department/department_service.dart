import 'package:motaperp_tctsolutions/core/constant/app/url/url_service/url_service.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/network/http/http_manager.dart';
import 'department_model.dart';
import 'department_response_model.dart';


abstract class  IDepartmentService{
  Future<dynamic> fetchList(DepartmentModel model,DepartmentResponseModel responseModel);
}

class DepartmentService implements IDepartmentService {

  LocaleManager localeManager = LocaleManager.instance;
  HttpManager? networkManager = HttpManager.instance;

  @override
  Future<dynamic>  fetchList(DepartmentModel model,DepartmentResponseModel responseModel) async {

    final response = await networkManager!.responseList<DepartmentModel, DepartmentResponseModel>(model, responseModel, UrlService.instance.departmentUrl);
      print("gelen response data:${response.data!}");
      return response.data;
  }

}