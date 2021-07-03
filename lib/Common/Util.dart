import 'package:flutter_vibrate/flutter_vibrate.dart';

void launchVibrate() async {
  // Check if the device can vibrate
  bool canVibrate = await Vibrate.canVibrate;
  if(canVibrate){
    Vibrate.vibrate();
  }
}