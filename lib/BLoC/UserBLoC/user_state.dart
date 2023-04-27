part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserDataLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserDataLoadedState extends UserState{
  final List<UserModel> userModel;

  const UserDataLoadedState(this.userModel);

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class UserDataNotLoadedState extends UserState{
  final String errorMessage;

  const UserDataNotLoadedState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}