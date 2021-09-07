

import 'package:flutter/material.dart';
import 'package:pattern_provider/viewmodel/create_view_model.dart';


class CreatePage extends StatefulWidget {
  static final String id = 'create_page';

  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel viewModel = CreateViewModel();


  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // Title
                Container(
                  height: 50,

                  child: Center(
                    child: TextField(
                      controller: viewModel.titleTextEditingController,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Body
                Container(
                  height: 200,
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: viewModel.bodyTextEditingController,
                    style: TextStyle(fontSize: 18),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          viewModel.apiPostCreate(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
