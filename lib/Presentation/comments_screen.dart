import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_example/BLoC/CommentBLoc/comment_bloc.dart';
import 'package:rest_api_flutter_example/Data/repositories/CommentRepository/comment_repository.dart';

import '../Data/Model/CommentModel.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc(RepositoryProvider.of<CommentRepository>(context))..add(GetCommentData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
        ),
        body: BlocBuilder<CommentBloc, CommentState>(
            builder: (context, state){
              if(state is CommentLoadingState){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is CommentLoadedState){
                List<CommentModel> commentsModel = state.comments;
                return ListView.builder(
                  itemCount: commentsModel.length,
                    itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Center(child: Text('Name: ${commentsModel[index].name}', style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black)),),
                            const SizedBox(height: 5,),
                            Center(child: Text('Email: ${commentsModel[index].email}', style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black)),),
                            const SizedBox(height: 10,),
                            Center(child: Text(commentsModel[index].body),),
                          ],
                        ),

                      ),
                    );
                    }
                );
              }
              if(state is CommentLoadingErrorState){
                return Center(child: Text(state.errorMessage),);
              }
              return Container();
            }
        ),
      ),


    );
  }
}
