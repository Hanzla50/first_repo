import 'package:flutter/material.dart';
import 'package:kids/view/calculator_view.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue ,
        body: SafeArea(
          child: CalculatorView(),
        )
        );
  }
}