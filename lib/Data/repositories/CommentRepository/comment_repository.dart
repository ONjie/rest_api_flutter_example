

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_flutter_example/Data/Api_constants/api_constant.dart';
import 'package:rest_api_flutter_example/Data/Model/CommentModel.dart';

class CommentRepository{
 final ApiConstants _apiConstants = ApiConstants();
  Future<List<CommentModel>?> getComments() async{
    try{
      var url = Uri.parse(_apiConstants.baseUrl + _apiConstants.commentsEndpoint);
      Response response = await http.get(url);

      if(response.statusCode == 200){
        List<CommentModel> commentModel = commentModelFromJson(response.body);
        return commentModel;
      }
    }catch(e){
      print(e.toString());
    }
  }
}