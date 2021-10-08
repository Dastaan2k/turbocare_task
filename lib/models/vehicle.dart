class Vehicle {

  String number, model, make, transmission, fuelType,wclass;

  Vehicle({this.number = '123',this.model = 'model123',this.transmission = 'transmission123',this.fuelType = 'fuelType123',this.make = 'make123',this.wclass = 'class123'});

  Map<String,dynamic> toMap() {
    return {
      'number': number,
      'model': model,
      'make': make,
      'transmission': transmission,
      'fuelType': fuelType
    };
  }

}