import 'package:flutter/foundation.dart';
import 'package:vehicle_app/classes/vehicle_class.dart';

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _bikeList = [
    Vehicle(
      vehicleNumber: 'TN 01 AB 1234',
      vehicleType: 'Bike',
      brandName: 'Honda',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 9012',
      vehicleType: 'Bike',
      brandName: 'TVS',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 2345',
      vehicleType: 'Bike',
      brandName: 'Yamaha',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 0123',
      vehicleType: 'Bike',
      brandName: 'Bajaj',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 8901',
      vehicleType: 'Bike',
      brandName: 'Hero',
      fuelType: 'Petrol',
    ),
  ];

  List<Vehicle> get bikeList => _bikeList;

  List<Vehicle> _carList = [
    Vehicle(
      vehicleNumber: 'TN 01 AB 3456',
      vehicleType: 'Car',
      brandName: 'Hyundai',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 7890',
      vehicleType: 'Car',
      brandName: 'Toyota',
      fuelType: 'Diesel',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 6789',
      vehicleType: 'Car',
      brandName: 'Ford',
      fuelType: 'Diesel',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 4567',
      vehicleType: 'Car',
      brandName: 'Honda',
      fuelType: 'Petrol',
    ),
    Vehicle(
      vehicleNumber: 'TN 01 AB 2468',
      vehicleType: 'Car',
      brandName: 'Chevrolet',
      fuelType: 'Petrol',
    ),
  ];

  List<Vehicle> get carList => _carList;

  void removeVehicle(Vehicle vehicle) {
    if (vehicle.vehicleType == 'Bike') {
      _bikeList.remove(vehicle);
    } else {
      _carList.remove(vehicle);
    }
    notifyListeners();
  }

  void addVehicle(Vehicle vehicle) {
    if (vehicle.vehicleType == 'Bike') {
      _bikeList.add(vehicle);
    } else {
      _carList.add(vehicle);
    }
    notifyListeners();
  }
}
