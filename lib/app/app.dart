import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view/home_view.dart';

void main(){
  runApp( const myapp());
}

class myapp extends StatelessWidget {
  const myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Flutter",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const home_view(),
      )
    ;
  }
}