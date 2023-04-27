import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Model/PostModel.dart';
import '../../Data/repositories/PostRepository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc(this._postRepository) : super(PostInitial()) {
    on<GetPostData>((event, emit) async {
      emit(PostDataLoadingState());
      try{
        final posts = await _postRepository.getPosts();
        emit(PostDataLoadedState(posts!));
      }catch(e){
        emit(const PostDataErrorState('Unable to load Posts'));
      }


    });
  }
}
