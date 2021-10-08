import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbocare_task/providers/app_state.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppStateProvider(),
      child:  MaterialApp(
        title: 'Turbocare Task',
        theme: ThemeData( primarySwatch: Colors.deepPurple ),
        home: Builder(
            builder: (context) {

              AppStateProvider _appStateProvider = Provider.of<AppStateProvider>(context);

              return WillPopScope(
                onWillPop: () {
                  if(_appStateProvider.pageStack.length == 1) {
                    return showDialog(context: context, builder: (context) => AlertDialog(
                        title: const Text('Exit Confirmation'),
                        content: const Text('Do you want to exit ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes'),
                        ),
                      ],
                    )).then((value) => value);
                  }
                  else {
                    _appStateProvider.popPage();
                    return SynchronousFuture(false);
                  }
                },
                child: Navigator(
                  pages: _appStateProvider.pageStack,
                  onPopPage: (route, settings) {
                    _appStateProvider.popPage();
                    return false;
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}


