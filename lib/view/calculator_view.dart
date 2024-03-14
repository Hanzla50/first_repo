// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x = 0;
  int y = 0;
  num z = 0;

  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;


  @override
  void initState(){
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onPause: _onPause,
      onInactive: _onInactive,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }
  void _onShow() => print("onShow caled");

  void _onHide() => print("onHide caled");

  void _onResume() => print("onResume caled");

  void _onDetach() => print("onDetach caled");

  void _onPause() => print("onPause caled");

  void _onInactive() => print("onInactive caled");

  void _onRestart() => print("onRestart caled");

  void _onStateChange(AppLifecycleState){
    print("onStateChanged called with State: $State");
  } 

@override
void dispose(){
  DisplayOneController.dispose();
  DisplayTwoController.dispose();
  _listener.dispose();
  super.dispose();
}
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calculator display
           CalculatorDisplay(hint: "Enter First Number", controller:  DisplayOneController),
          const SizedBox(height: 30,
          ),
           CalculatorDisplay(hint: "Enter Second Number", controller:  DisplayTwoController),
          const SizedBox(height: 30,
          ),
           Text(
            z.toString(),
            style: const TextStyle(
            fontSize: 60,fontWeight: FontWeight.bold, color: Colors.white
          ),),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    
                 
                  z = num.tryParse(DisplayOneController.text)! + 
                      num.tryParse(DisplayTwoController.text)!;
                   });
              },
              child: const Icon(Icons.add),
              ),
              FloatingActionButton(onPressed: () {
                setState(() {
                    
                 
                  z = num.tryParse(DisplayOneController.text)! - 
                      num.tryParse(DisplayTwoController.text)!;
                   });
                
              },
              child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(onPressed: () {
                setState(() {
                    
                 
                  z = num.tryParse(DisplayOneController.text)! * 
                      num.tryParse(DisplayTwoController.text)!;
                   });
                
              },
              child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(onPressed: () {
                setState(() {
                    
                 
                  z = num.tryParse(DisplayOneController.text)! / 
                      num.tryParse(DisplayTwoController.text)!;
                   });
                
              },
              child: const Icon(CupertinoIcons.divide),
              ),
              
            ],
          ),
          const SizedBox(height: 10,),
           FloatingActionButton.extended (
            onPressed: (){
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
                
              });
              },
              label: const Text("Clear"),

           ) 
              
              ,
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter a Number", required this.controller
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white
        )
      
    
      )
    );
  }
}