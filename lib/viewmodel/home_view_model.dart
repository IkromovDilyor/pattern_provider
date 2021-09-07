import 'package:flutter/foundation.dart';
import 'package:pattern_provider/model/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';

class HomeViewModel extends ChangeNotifier{
  bool isLoading =false;
  List<Post> items=new List();
 Future apiPostList()async{
    isLoading=true;
    notifyListeners();

    var response=await Network.GET(Network.API_LIST, Network.paramsEmpty());

      if(response!=null){
        items=Network.parsePostList(response);
      }else{
        items=new List();
      }
      isLoading=false;

  }
 Future<bool> apiPostDelete(Post post)async{

      isLoading=true;
      notifyListeners();

      var response =await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());

    isLoading=false;
    notifyListeners();
   return response!=null;

  }

}