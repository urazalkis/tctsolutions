import 'job_employee_model_response.dart';

abstract class IJobEmployeeState{
  IJobEmployeeState();

}

class JobEmployeeInit extends IJobEmployeeState{
  JobEmployeeInit();
}
class JobEmployeeLoading extends IJobEmployeeState{
  late bool isLoading;
  JobEmployeeLoading(isLoading);
}
class JobEmployeeLoaded extends IJobEmployeeState{
  List<JobEmployeeResponseModel> myList;
  JobEmployeeLoaded(this.myList);
}

class JobEmployeeError extends IJobEmployeeState{
  String errorMessage;
  JobEmployeeError(this.errorMessage);
}