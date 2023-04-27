part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoadingState extends CommentState {
  @override
  List<Object> get props => [];
}
class CommentLoadedState extends CommentState {
final List<CommentModel> comments;

  const CommentLoadedState(this.comments);
  @override
  List<Object> get props => [comments];
}
class CommentLoadingErrorState extends CommentState {
  final String errorMessage;
  const CommentLoadingErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}