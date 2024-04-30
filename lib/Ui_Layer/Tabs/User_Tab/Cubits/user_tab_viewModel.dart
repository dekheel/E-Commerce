import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain_Layer/Entities/get_user_entity.dart';
import 'package:e_commerce/Domain_Layer/Use_Cases/get_user_use_case.dart';
import 'package:e_commerce/Ui_Layer/Tabs/User_Tab/Cubits/user_states.dart';

class UserTabViewModel extends Cubit<UserStates> {
  UserTabViewModel({required this.getUserUseCase}) : super(UserInitialStates());

  GetUserUseCase getUserUseCase;

  GetUserEntity? userEntity;

  void getUserData() async {
    emit(UserLoadingStates(message: "Loading...."));
    var userData = await getUserUseCase.getUserData();
    userData.fold(
      (failure) {
        emit(UserErrorStates(failures: failure));
      },
      (response) {
        userEntity = response;
        emit(UserSuccessStates());
      },
    );
  }
}
