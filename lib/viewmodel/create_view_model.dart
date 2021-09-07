import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/model/post_model.dart';
import 'package:pattern_provider/pages/home_page.dart';
import 'package:pattern_provider/services/http_service.dart';

class CreateViewModel extends ChangeNotifier{
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context) async {

      isLoading = true;
      notifyListeners();


    Post post = Post(
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(99999));

    var response =
    await Network.GET(Network.API_CREATE, Network.paramsCreate(post));


      if (response != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      }

      isLoading = false;
      notifyListeners();

  }
}