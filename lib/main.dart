import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_example/BLoC/CommentBLoc/comment_bloc.dart';
import 'package:rest_api_flutter_example/Data/repositories/CommentRepository/comment_repository.dart';
import 'package:rest_api_flutter_example/Data/repositories/PostRepository/post_repository.dart';
import 'package:rest_api_flutter_example/Data/repositories/UserRepository/users_api_repository.dart';
import 'package:rest_api_flutter_example/Presentation/post_screen.dart';
import 'package:rest_api_flutter_example/Presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
        RepositoryProvider(
          create: (context) => UsersApiRepository(),
        ),
        RepositoryProvider(create: (context)=> CommentRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,),
        home: const HomeScreen(),
      ),
    );
  }
}

