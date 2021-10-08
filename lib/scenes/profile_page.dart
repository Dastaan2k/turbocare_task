import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/models/vehicle.dart';
import 'package:turbocare_task/providers/app_state.dart';

class ProfilePage extends StatefulWidget {

  final Vehicle vehicle;

  const ProfilePage(this.vehicle,{Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late double width;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, width * 0.65),
        child: ProfileAppBar(widget.vehicle.model + ' ' + widget.vehicle.fuelType,widget.vehicle.number),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10, width: 1,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ProfileContentCard('MAKE',widget.vehicle.make)
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ProfileContentCard('MODEL',widget.vehicle.model)
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ProfileContentCard('FUEL TYPE',widget.vehicle.fuelType)
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ProfileContentCard('TRANSMISSION',widget.vehicle.transmission)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class ProfileAppBar extends StatelessWidget {

  final String title, vNumber;

  const ProfileAppBar(this.title,this.vNumber,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppStateProvider _appStateProvider = Provider.of<AppStateProvider>(context,listen: false);

    return Container(
      color: Colors.deepPurple,
      padding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
               child: InkWell(
                 onTap: () {
                   _appStateProvider.popPage();
                 },
                   child: const Icon(Icons.arrow_back,color: Colors.white)
               ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toUpperCase(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                  const SizedBox(width: 1, height: 5,),
                  Text(vNumber.toUpperCase(),style: TextStyle(color: Colors.grey.shade300,fontSize: 14),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}



class ProfileContentCard extends StatelessWidget {

  final String title, subtitle;

  const ProfileContentCard(this.title, this.subtitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title.toUpperCase(),style: TextStyle(color: Colors.grey.shade700),),
        const SizedBox(width: 1, height: 7.5,),
        Text(subtitle.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}

