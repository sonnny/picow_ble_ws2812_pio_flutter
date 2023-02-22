//
// flutter create your_app
// cd your_app
// flutter pub add get
// flutter pub add flutter_reactive_ble
// android settings, app, give location permission for ble to work

// filename: main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './blecontroller.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
@override
Widget build(BuildContext context) {
final BleController ble = Get.put(BleController());
return Scaffold(
appBar: AppBar(title: const Text('Pico W Nordic BLE SPP RGB demo')),
body: Center(child: Column(children:[

SizedBox(height: 50.0),

ElevatedButton(
onPressed: ble.connect,
child: Obx(() => Text('${ble.status.value}',
style: TextStyle(
fontSize: 25, fontWeight: FontWeight.bold)))),
          
SizedBox(height: 20.0),
button(()=>ble.sendData(0x72),'RED'),

SizedBox(height: 20.0),
button(()=>ble.sendData(0x67),'BLUE'),

SizedBox(height: 20.0),
button(()=>ble.sendData(0x62),'GREEN'), 

])));}

Widget button(func,text){
  return ElevatedButton(child:Text(text,style:TextStyle(fontSize:20)),
  onPressed:func);}
}

