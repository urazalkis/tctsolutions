import 'employee_detail_model_response.dart';

abstract class IEmployeeBusinessDetailState{
  IEmployeeBusinessDetailState();

}

class JEmployeeBusinessDetailInit extends IEmployeeBusinessDetailState{
  JEmployeeBusinessDetailInit();
}
class EmployeeBusinessDetailLoading extends IEmployeeBusinessDetailState{
  late bool isLoading;
  EmployeeBusinessDetailLoading(isLoading);
}
class EmployeeBusinessDetailLoaded extends IEmployeeBusinessDetailState{

  List<EmployeeBusinessDetailResponseModel>? myList;
  EmployeeBusinessDetailLoaded(this.myList);
}
class EmployeeBusinessDetailError extends IEmployeeBusinessDetailState{
  String errorMessage;
  EmployeeBusinessDetailError(this.errorMessage);
}