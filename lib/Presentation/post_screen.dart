import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_example/BLoC/PostBLoC/post_bloc.dart';
import 'package:rest_api_flutter_example/Data/repositories/PostRepository/post_repository.dart';

import '../Data/Model/PostModel.dart';
import 'comments_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PostBloc(RepositoryProvider.of<PostRepository>(context))..add(GetPostData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommentsScreen()));
            }, child: const Text('Comments', style: TextStyle(color: Colors.white),)),
          ],
        ),
        body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state){
              if(state is PostDataLoadingState){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is PostDataLoadedState){
                List<PostModel> posts = state.post;

                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Center(child: Text(posts[index].title, style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black),)),
                              const SizedBox(height: 10,),
                              Center(child: Text(posts[index].body)),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
              if(state is PostDataErrorState){
                return Center(child: Text(state.errorMessage),);
              }
              return Container();
            }
        ),
      ),
    );
  }
}
