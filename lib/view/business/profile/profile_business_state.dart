import 'package:flutter/cupertino.dart';
import 'package:motaperp_tctsolutions/view/business/profile/profile_business_model_response.dart';

abstract class IProfileBusinessState{
  IProfileBusinessState();

}

class ProfileBusinessInit extends IProfileBusinessState{
  ProfileBusinessInit();
}
class ProfileBusinessLoading extends IProfileBusinessState{
  late bool isLoading;
  ProfileBusinessLoading(isLoading);
}
class ProfileBusinessLoaded extends IProfileBusinessState{

  ProfileBusinessResponseModel? profile;
  ProfileBusinessLoaded(this.profile);
}
class EditingUserName extends IProfileBusinessState{

  late bool isEditingUserName;
  EditingUserName(editingUserName);
}
class EditingPassword extends IProfileBusinessState{

  late bool isEditingPassword;
  EditingPassword(isEditingPassword);
}
class UpdateProfileLoading extends IProfileBusinessState{

  late bool isLoading;
  UpdateProfileLoading(isLoading);
}
class ProfileUpdated extends IProfileBusinessState{

  late TextEditingController userText;
  late TextEditingController passwordText;
  ProfileUpdated(userText,passwordText);
}
class ProfileBusinessError extends IProfileBusinessState{
  String errorMessage;
  ProfileBusinessError(this.errorMessage);
}