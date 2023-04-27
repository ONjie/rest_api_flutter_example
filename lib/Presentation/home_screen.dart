import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_example/Data/repositories/UserRepository/users_api_repository.dart';

import '../BLoC/UserBLoC/user_bloc.dart';
import '../Data/Model/UserModel.dart';
import 'post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(RepositoryProvider.of<UsersApiRepository>(context))..add(GetUserData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('REST API Example'),
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostScreen()));
            }, child: const Text('Posts', style: TextStyle(color: Colors.white),)),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
            builder:(context, state){
              if(state is UserDataLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              if(state is UserDataLoadedState){
                List<UserModel> userData = state.userModel;
                return ListView.builder(
                  itemCount: userData.length,
                    itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          Text('Name: ${userData[index].name}'),
                          const SizedBox(height: 15,),
                          Text('Email: ${userData[index].email}'),
                          const SizedBox(height: 15,),
                          Text('Phone: ${userData[index].phone}'),
                          const SizedBox(height: 15,),
                          Text('Website: ${userData[index].website}'),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    );
                    }
                    );
              }

              if(state is UserDataNotLoadedState){
                return Center(child: Text(state.errorMessage),);
              }
              return Container();
            }
        ),
      ),
    );
  }
}
