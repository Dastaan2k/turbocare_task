import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbocare_task/models/vehicle.dart';

import 'api_response.dart';

class TurbocareAPI {

  String baseUrl = 'https://test.turbocare.app/turbo/care/v1/';

  Future<APIResponse> getMakes(String wClass) {

    return http.get(Uri.parse(baseUrl + 'makes?class=$wClass')).then((response) {
      if(response.statusCode == 200) {
        return APIResponse(data: jsonDecode(response.body));
      } else {
        return APIResponse(error: true,statusCode: response.statusCode,reasonPhrase: response.reasonPhrase);
      }
    });

  }


  Future<APIResponse> getModels(String wClass,String make) {

    return http.get(Uri.parse(baseUrl + 'models?class=$wClass&make=${make.toLowerCase()}')).then((response) {
      if(response.statusCode == 200) {
        return APIResponse(data: jsonDecode(response.body));
      } else {
        return APIResponse(error: true,statusCode: response.statusCode,reasonPhrase: response.reasonPhrase);
      }
    });

  }

  Future<APIResponse> getVehicles() {

    return SharedPreferences.getInstance().then((pref) {

        if(pref.containsKey('vehicles')) {
          if(pref.getStringList('vehicles')!.isEmpty) {
            return APIResponse(data: <String>[]);
          } else {
            return APIResponse(data: pref.getStringList('vehicles'));
          }
        }
        else {
          return APIResponse(data: <String>[]);
        }

    });

  }

  Future<APIResponse> addVehicle(Vehicle vehicle) {

    return SharedPreferences.getInstance().then((pref) {

      if(!pref.containsKey('vehicles')){
        pref.setStringList('vehicles', []);
      }

      List<String> a = pref.getStringList('vehicles')!;
      a.add(jsonEncode(vehicle.toMap()));
      pref.setStringList('vehicles', a);

      return APIResponse();
    });

  }

}