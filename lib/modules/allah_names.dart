import 'package:flutter/material.dart';
import 'package:muslimapp/models/allah_names_list.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AllahNames extends StatelessWidget {
  const AllahNames({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(translate('plural.allah_names_page.appBarTitle')),
          backgroundColor: Colors.teal,
          // The leading property can be used to customize the AppBar icon like a back button
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // This line of code will pop the current route off the stack
              Navigator.pop(context);
            },
          ),
        ),
        body: const AllahNamesGrid(),
      ),
    );
  }
}
