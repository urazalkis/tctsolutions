import 'department_response_model.dart';

abstract class IDepartmentState{
  IDepartmentState();

}

class DepartmentInit extends IDepartmentState{
  DepartmentInit();
}
class DepartmentLoading extends IDepartmentState{
  late bool isLoading;
  DepartmentLoading(isLoading);
}
class DepartmentLoaded extends IDepartmentState{

  List<DepartmentResponseModel> myList;
  DepartmentLoaded(this.myList);
}
class DepartmentError extends IDepartmentState{
  String errorMessage;
  DepartmentError(this.errorMessage);
}