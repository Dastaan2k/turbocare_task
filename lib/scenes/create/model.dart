import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/misc/api_response.dart';
import 'package:turbocare_task/misc/turbocare_api.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/fuel_type.dart';
import 'package:turbocare_task/widgets/list_element.dart';

import '../../main.dart';

class ModelPage extends StatefulWidget {

  final String wClass,make;

  const ModelPage(this.wClass,this.make,{Key? key}) : super(key: key);

  @override
  _ModelPageState createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {

  late AppStateProvider _appStateProvider;

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Model')),
      body: FutureBuilder<APIResponse>(
        future: TurbocareAPI().getModels(widget.wClass,widget.make),
        builder: (context, future) {

          if(future.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Fetching Data ... '),);
          } else {

            if(future.data!.error) {
              return Center(child: Text('Error : ${future.data!.statusCode}'),);
            } else {

              List response = future.data!.data;

              return response.isEmpty ? const Center(child: Text('No makes for this class'),) : ListView(
                padding: const EdgeInsets.only(top: 10),
                children: List.generate(response.length, (index) => ListElement(response[index], () {
                  _appStateProvider.pushPage(FuelTypePage(widget.wClass,widget.make,response[index]),'create/ftype');
                })),
              );
            }

          }

        },
      )
    );
  }

}
