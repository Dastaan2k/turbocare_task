import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/make.dart';
import 'package:turbocare_task/widgets/list_element.dart';

class ClassPage extends StatefulWidget {

  const ClassPage({Key? key}) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {

  late AppStateProvider _appStateProvider;

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Class')),
      body: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: [
            ListElement('Car',() {
              _appStateProvider.pushPage(const MakePage('4w'), 'create/make/4w');
            }),
            ListElement('Bike',() {
              _appStateProvider.pushPage(const MakePage('2w'), 'create/make/2w');
            })
          ]
      ),
    );

  }

}
