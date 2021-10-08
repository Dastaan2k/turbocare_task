import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/main.dart';
import 'package:turbocare_task/misc/api_response.dart';
import 'package:turbocare_task/misc/turbocare_api.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/model.dart';
import 'package:turbocare_task/widgets/list_element.dart';

class MakePage extends StatefulWidget {

  final String wClass;

  const MakePage(this.wClass,{Key? key}) : super(key: key);

  @override
  _MakePageState createState() => _MakePageState();
}

class _MakePageState extends State<MakePage> {

  late AppStateProvider _appStateProvider;

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Make')),
      body: FutureBuilder<APIResponse>(
        future: TurbocareAPI().getMakes(widget.wClass),
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
                    _appStateProvider.pushPage(ModelPage(widget.wClass,response[index]),'create/model');
                  })),
              );
            }
          }
        },
      )
    );
  }
}

