import 'my_job_employee_model_response.dart';

abstract class IMyJobEmployeeState{
  IMyJobEmployeeState();

}

class MyJobEmployeeInit extends IMyJobEmployeeState{
  MyJobEmployeeInit();
}
class MyJobEmployeeLoading extends IMyJobEmployeeState{
  late bool isLoading;
  MyJobEmployeeLoading(isLoading);
}
class MyJobEmployeeLoaded extends IMyJobEmployeeState{

  List<MyJobEmployeeResponseModel> myList;
  MyJobEmployeeLoaded(this.myList);
}
class MyJobEmployeeError extends IMyJobEmployeeState{
  String errorMessage;
  MyJobEmployeeError(this.errorMessage);
}