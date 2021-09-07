

import 'package:flutter/material.dart';

import 'package:pattern_provider/viewmodel/update_view_-model.dart';
import 'package:provider/provider.dart';



class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String title, body;
  UpdatePage({this.title, this.body, Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();


  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.title;
    viewModel.bodyTextEditingController.text = widget.body;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) =>viewModel,
        child: Consumer<UpdateViewModel>(
          builder: (context, index, model)=>
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Title
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(5),

                          child: Center(
                            child: TextField(maxLines: 2,
                              controller: viewModel.titleTextEditingController,
                              style: TextStyle(fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Title',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),




                        // Body
                        Container(
                          height: 500,
                          padding: EdgeInsets.all(5),

                          child: TextField(
                            controller: viewModel.bodyTextEditingController,
                            style: TextStyle(fontSize: 20),
                            maxLines: 10,
                            decoration: InputDecoration(
                              labelText: 'Body',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  viewModel.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              ),


        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          viewModel.apiPostUpdate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
