import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter_example/Data/Api_constants/api_constant.dart';
import 'package:rest_api_flutter_example/Data/Model/UserModel.dart';

class UsersApiRepository{
  final ApiConstants _apiConstants = ApiConstants();

  Future<List<UserModel>?> getUser() async{
    try{
      var url = Uri.parse(_apiConstants.baseUrl + _apiConstants.usersEndpoint);
      var response = await http.get(url);

      if(response.statusCode == 200){
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }

    }catch(e){
  log(e.toString());
    }
  }

}