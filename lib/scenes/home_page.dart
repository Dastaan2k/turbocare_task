import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/misc/api_response.dart';
import 'package:turbocare_task/misc/turbocare_api.dart';
import 'package:turbocare_task/models/vehicle.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/vehicle_number.dart';
import 'package:turbocare_task/scenes/profile_page.dart';
import 'package:turbocare_task/widgets/list_element.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late AppStateProvider _appStateProvider;

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Vehicles')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _appStateProvider.pushPage(const VehicleNumberPage(), 'create/vnumber');
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<APIResponse>(
        future: TurbocareAPI().getVehicles(),
        builder: (context, future) {

          if(future.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Fetching Data ...'));
          } else {

            if(future.data!.error) {
              return const Center(child: Text('Error occured'),);
            }
            else {

              List<String> responseList = future.data!.data;

              if(responseList.isEmpty) {
                return const Center(child: Text('No vehicles created'),);
              } else {
                return ListView(
                    padding: const EdgeInsets.only(top: 10),
                    children: List.generate(responseList.length, (index) {

                      Map<String,dynamic> decodedResponse = jsonDecode(responseList[index]);

                      return ListElement(decodedResponse['make'] + ' ' + decodedResponse['model'],(){
                        _appStateProvider.pushPage(ProfilePage(Vehicle(number: decodedResponse['number'],transmission: decodedResponse['transmission'],fuelType: decodedResponse['fuelType'],model: decodedResponse['model'],make: decodedResponse['make'])), 'profile');
                      },hasTitle: true,title: decodedResponse['number']);
                    })
                );
              }
            }

          }

        },
      )
    );
  }
}


