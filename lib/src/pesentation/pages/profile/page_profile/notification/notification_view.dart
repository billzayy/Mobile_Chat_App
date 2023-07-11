import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationView extends StatelessWidget {
  static const String routerName = '/NotificationView';
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
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
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  onChangeFunction1(bool newValue1){
    setState(() {
      val1 = newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState(() {
      val2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3){
    setState(() {
      val3 = newValue3;
    });
  }
  onChangeFunction4(bool newValue4){
    setState(() {
      val4 = newValue4;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSwitch('Do not bother', val1, onChangeFunction1),
              customSwitch('New friends notification', val2, onChangeFunction2),
              customSwitch('Receive message', val3, onChangeFunction3),
              customSwitch('Show preview message', val4, onChangeFunction4),
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
