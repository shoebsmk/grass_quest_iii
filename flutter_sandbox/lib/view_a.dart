import 'package:flutter/material.dart';
import 'package:flutter_sandbox/data_controller.dart';
import 'package:flutter_sandbox/view_b.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewA extends StatefulWidget {
  const ViewA({super.key});

  @override
  State<ViewA> createState() => _ViewAState();
}

class _ViewAState extends State<ViewA> {
  bool isValueTrue = false;

  @override
  void initState() {
    super.initState();
    _checkPrefLoad();

  }


  Future<void> _checkPrefLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    //prefs.setBool('first_launch', true);
    setState(() {
      isValueTrue = prefs.getBool('first_launch') ?? false;
      if(isValueTrue){
        Get.to(() => ViewB());
      }
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('View A'),
        ),
        body: const Center(
          child: Text(
            'This is a A widget!',
            style: TextStyle(fontSize: 24),
          ),
        )

        // const Center(
        //   child: Text(
        //     'This is a A widget!',
        //     style: TextStyle(fontSize: 24),
        //   ),
        // ),
        );
  }
}
