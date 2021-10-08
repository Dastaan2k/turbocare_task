import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/misc/data.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/transmission.dart';
import 'package:turbocare_task/widgets/list_element.dart';

class FuelTypePage extends StatefulWidget {

  final String wClass, make, model;

  const FuelTypePage(this.wClass,this.make,this.model,{Key? key}) : super(key: key);

  @override
  _FuelTypePageState createState() => _FuelTypePageState();
}

class _FuelTypePageState extends State<FuelTypePage> {

  late AppStateProvider _appStateProvider;

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Fuel Type')),
      body: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: List.generate(Data.fuelTypeList.length, (index) => ListElement(Data.fuelTypeList[index],() {
            _appStateProvider.pushPage(TransmissionPage(widget.wClass,widget.make,widget.model,Data.fuelTypeList[index]), 'create/transmission');
          }))
      ),
    );

  }
}
