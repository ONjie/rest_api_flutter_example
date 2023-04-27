part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostDataLoadingState extends PostState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class PostDataLoadedState extends PostState{
  final List<PostModel> post ;
  const PostDataLoadedState(this.post);

  @override
  // TODO: implement props
  List<Object?> get props => [post];

}

class PostDataErrorState extends PostState{
  final String errorMessage;

  const PostDataErrorState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}
