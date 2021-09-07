import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/model/post_model.dart';
import 'package:pattern_provider/pages/home_page.dart';
import 'package:pattern_provider/services/http_service.dart';

class UpdateViewModel extends ChangeNotifier{
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

   Future apiPostUpdate(BuildContext context) async {

      isLoading = true;
      notifyListeners();


    Post post = Post(
        id: Random().nextInt(999),
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(999));

    var response =
    await Network.PUT(Network.API_UPDATE , Network.paramsUpdate(post));


      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }

      isLoading = false;
      notifyListeners();


  }
}