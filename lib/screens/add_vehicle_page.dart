import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/classes/vehicle_class.dart';
import 'package:vehicle_app/providers/vehicle_provider.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  List<String> vehicletypes = ['Bike', 'Car'];
  List<String> brandnames = [
    'Honda',
    'TVS',
    'Yamaha',
    'Bajaj',
    'Hero',
    'Hyundai',
    'Toyota',
    'Ford',
    'Maruti',
    'Mahindra',
    'Chevrolet'
  ];
  List<String> fueltypes = ['Petrol', 'Diesel'];
  String selectedVehicleType = 'Bike';
  String selectedBrandName = 'Honda';
  String selectedFuelType = 'Petrol';

  final TextEditingController _vehicleNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vehicleProvider =
        Provider.of<VehicleProvider>(context, listen: false);
    Vehicle vehicle;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _vehicleNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Vehicle Number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Brand Name',
                      ),
                      isExpanded: true,
                      value: selectedBrandName,
                      items: brandnames
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedBrandName = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vehicle Type',
                      ),
                      isExpanded: true,
                      value: selectedVehicleType,
                      items: vehicletypes
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVehicleType = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fuel Type',
                      ),
                      isExpanded: true,
                      value: selectedFuelType,
                      items: fueltypes
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedFuelType = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  if (_vehicleNumberController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter vehicle number!'),
                      ),
                    );
                  } else {
                    Vehicle vehicle2 = Vehicle(
                        vehicleNumber: _vehicleNumberController.text,
                        vehicleType: selectedVehicleType,
                        brandName: selectedBrandName,
                        fuelType: selectedFuelType);
                    vehicleProvider.addVehicle(vehicle2);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Vehicle Added Successfully!'),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text('Add Vehicle',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
