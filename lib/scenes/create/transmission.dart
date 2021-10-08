import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/misc/data.dart';
import 'package:turbocare_task/misc/turbocare_api.dart';
import 'package:turbocare_task/models/vehicle.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/home_page.dart';
import 'package:turbocare_task/widgets/list_element.dart';

import '../../main.dart';

class TransmissionPage extends StatefulWidget {

  final String wClass, make, model, fType;

  const TransmissionPage(this.wClass,this.make,this.model,this.fType,{Key? key}) : super(key: key);

  @override
  _TransmissionPageState createState() => _TransmissionPageState();
}

class _TransmissionPageState extends State<TransmissionPage> {
  
  late AppStateProvider _appStateProvider;
  
  @override
  Widget build(BuildContext context) {
    
    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Select Transmission')),
      body: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: List.generate(Data.transmissionList.length, (index) => ListElement(Data.transmissionList[index],(){
            TurbocareAPI().addVehicle(Vehicle(wclass: widget.wClass,make: widget.make,model: widget.model,fuelType: widget.fType,number: Data.savedVNumber,transmission: Data.transmissionList[index])).then((value) {
              Data.savedVNumber = '';
              Data.willPopScopeKey = Random.secure().nextDouble().toString();
              _appStateProvider.changePageStack(const [CupertinoPage(child: HomePage(),key: ValueKey('home'))]);
            });
          }))
      ),
    );
  }
}
