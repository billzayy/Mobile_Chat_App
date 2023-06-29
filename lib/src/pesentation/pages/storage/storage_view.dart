import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorageView extends StatelessWidget {
  static const String routerName = '/StorageView';
  const StorageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: MultiSwitch(),
      ),
    );
  }
}

class MultiSwitch extends StatefulWidget {
  const MultiSwitch({Key? key}) : super(key: key);

  @override
  State<MultiSwitch> createState() => _MultiSwitchState();
}

class _MultiSwitchState extends State<MultiSwitch> {
  bool val1 = true;

  onChangeFunction1(bool newValue1){
    setState(() {
      val1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSwitch('Auto save image', val1, onChangeFunction1),

        ],
      ),
    );
  }
  Widget customSwitch(String text, bool val, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(
              fontSize: 19.0,
              // fontWeight: FontWeight.w400,
              color: Colors.black
          )),
          const Spacer(),
          CupertinoSwitch(
              value: val,
              trackColor: Colors.grey,
              activeColor: Colors.green,
              onChanged: (newValue) {
                onChangeMethod(newValue);
              }
          )
        ],
      ),
    );
  }
}