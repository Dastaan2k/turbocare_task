import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/misc/data.dart';
import 'package:turbocare_task/providers/app_state.dart';
import 'package:turbocare_task/scenes/create/class.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VehicleNumberPage extends StatefulWidget {
  const VehicleNumberPage({Key? key}) : super(key: key);

  @override
  _VehicleNumberPageState createState() => _VehicleNumberPageState();
}

class _VehicleNumberPageState extends State<VehicleNumberPage> {

  late AppStateProvider _appStateProvider;
  TextEditingController vNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Create a new vehicle profile')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(vNumController.text == '') {
            Fluttertoast.showToast(msg: 'Vehicle Number is required',backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.BOTTOM);
          } else {
            Data.savedVNumber = vNumController.text;
            _appStateProvider.pushPage(const ClassPage(), 'create/class');
          }
        },
        child: const Icon(Icons.arrow_forward_ios,size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('VEHICLE NUMBER',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 60,
                child: TextField(
                  controller: vNumController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    hintText: 'Vehicle Number',
                    hintStyle: TextStyle(color: Colors.grey.shade400)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
