import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Data/Model/CommentModel.dart';
import '../../Data/repositories/CommentRepository/comment_repository.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;
  CommentBloc(this._commentRepository) : super(CommentInitial()) {
    on<GetCommentData>((event, emit) async{
      // TODO: implement event handler
      emit(CommentLoadingState());
      try{
        final comment = await _commentRepository.getComments();
        emit(CommentLoadedState(comment!));
      }catch(e){
        emit(const CommentLoadingErrorState('Unable to load comments'));
      }
    });
  }
}
