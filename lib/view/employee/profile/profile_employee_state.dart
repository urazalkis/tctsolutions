import 'package:flutter/cupertino.dart';


abstract class IProfileEmployeeState{
  IProfileEmployeeState();
}

class ProfileEmployeeInit extends IProfileEmployeeState{
  ProfileEmployeeInit();
}
class ProfileInformationLoading extends IProfileEmployeeState{
  late bool isLoading;
  ProfileInformationLoading(isLoading);
}
class ProfileInformationLoaded extends IProfileEmployeeState{
  int? completedJobHour;
  int? totalJobHour;
  ProfileInformationLoaded(this.completedJobHour,this.totalJobHour);
}




class EditingUserName extends IProfileEmployeeState{

  late bool isEditingUserName;
  EditingUserName(editingUserName);
}
class EditingPassword extends IProfileEmployeeState{

  late bool isEditingPassword;
  EditingPassword(isEditingPassword);
}


class UpdateProfileLoading extends IProfileEmployeeState{

  late bool isLoading;
  UpdateProfileLoading(isLoading);
}
class ProfileUpdated extends IProfileEmployeeState{

  late TextEditingController userText;
  late TextEditingController passwordText;
  ProfileUpdated(userText,passwordText);
}


class ProfileEmployeeError extends IProfileEmployeeState{
  String errorMessage;
  ProfileEmployeeError(this.errorMessage);
}