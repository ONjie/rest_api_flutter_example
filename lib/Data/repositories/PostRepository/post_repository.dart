import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_flutter_example/Data/Api_constants/api_constant.dart';
import 'package:rest_api_flutter_example/Data/Model/PostModel.dart';

class PostRepository{
 final ApiConstants _apiConstants = ApiConstants();
Future<List<PostModel>?> getPosts() async{

  try{
    var url = Uri.parse(_apiConstants.baseUrl + _apiConstants.postsEndpoint);
    Response response = await http.get(url);

    if(response.statusCode == 200){
      List<PostModel> model = postModelFromJson(response.body);
      return model;
    }

  }catch(e){
    print(e.toString());
  }



}
}