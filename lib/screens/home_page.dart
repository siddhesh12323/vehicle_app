import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_app/providers/vehicle_provider.dart';
import 'package:vehicle_app/screens/add_vehicle_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Vehicle Details'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  const TabBar(tabs: [Tab(text: 'Bike'), Tab(text: 'Car')]),
                  (vehicleProvider.bikeList.isEmpty &&
                          vehicleProvider.carList.isEmpty)
                      ? const Expanded(
                          child: TabBarView(
                          children: [
                            Center(
                              child: Text('No vehicles added yet!'),
                            ),
                            Center(
                              child: Text('No vehicles added yet!'),
                            )
                          ],
                        ))
                      : Expanded(
                          child: TabBarView(children: [
                            Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: vehicleProvider.bikeList.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  24,
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .bikeList[index]
                                                              .vehicleNumber
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .bikeList[index]
                                                              .brandName
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .bikeList[index]
                                                              .vehicleType
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .bikeList[index]
                                                              .fuelType
                                                              .toString()),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () {
                                                  vehicleProvider.removeVehicle(
                                                      vehicleProvider
                                                          .bikeList[index]);
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: vehicleProvider.carList.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  24,
                                              child: Card(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .carList[index]
                                                              .vehicleNumber
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .carList[index]
                                                              .brandName
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .carList[index]
                                                              .vehicleType
                                                              .toString()),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          vehicleProvider
                                                              .carList[index]
                                                              .fuelType
                                                              .toString()),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () {
                                                  vehicleProvider.removeVehicle(
                                                      vehicleProvider
                                                          .carList[index]);
                                                },
                                                icon: const Icon(Icons.close),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                )
                              ],
                            ),
                          ]),
                        )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddVehicle()));
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
          )),
    );
  }
}
