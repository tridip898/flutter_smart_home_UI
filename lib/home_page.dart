import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/smart-devices_box.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List devices = [
    //deviceName, icon, powerStatus
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/cooler.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart Door", "lib/icons/door-lock.png", false],
  ];

  void switchChanged(bool value,int index){
    setState(() {
      devices[index][2]=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(
                    AssetImage("lib/icons/menu.png"),
                    color: Colors.grey.shade700,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.grey.shade700,
                    size: 30,
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //welcome
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700
                    ),
                  ),
                  Text(
                    "Tridip Villa",
                    style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontSize: 60)),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(thickness: 2,color: Colors.grey.shade400,),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text("Our Smart Devices",style: TextStyle(fontSize: 22,color: Colors.grey.shade700,fontWeight: FontWeight.bold),),
            ),

            //grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(15),
                  itemCount: devices.length,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      deviceName: devices[index][0],
                      iconPath: devices[index][1],
                      powerStatus: devices[index][2],
                      onChanged: (value)=>switchChanged(value,index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
