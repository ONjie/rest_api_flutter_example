import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Model/UserModel.dart';
import '../../Data/repositories/UserRepository/users_api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersApiRepository _apiRepository;


  UserBloc(this._apiRepository) : super(UserDataLoadingState()) {
    on<GetUserData>((event, emit) async{
      // TODO: implement event handler
      emit(UserDataLoadingState());
      try{
        final user = await _apiRepository.getUser();
        emit(UserDataLoadedState(user!));
      }catch(e){
         emit(const UserDataNotLoadedState('Failed to load data'));
      }
    });

  }
}
