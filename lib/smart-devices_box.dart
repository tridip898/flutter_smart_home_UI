import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerStatus;
  void Function(bool)? onChanged;

  SmartDeviceBox(
      {Key? key,
      required this.deviceName,
      required this.iconPath,
      required this.powerStatus,
        required this.onChanged
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerStatus==true ? Colors.indigoAccent.shade100 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon
            Image.asset(
              iconPath,
              height: 75,
            ),

            //device name + status
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    deviceName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: powerStatus==true ? Colors.white70 : Colors.grey.shade800),
                  ),
                )),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                        value: powerStatus, onChanged: onChanged
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
