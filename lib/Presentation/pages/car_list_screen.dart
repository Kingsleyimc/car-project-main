import 'package:car_project/Presentation/bloc/car_bloc.dart';
import 'package:car_project/Presentation/bloc/car_event.dart';
import 'package:car_project/Presentation/bloc/car_state.dart';
import 'package:car_project/Presentation/widgets/car_card.dart';
import 'package:car_project/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
        model: 'Fortuner Gr',
        distance: 870,
        fuelCapacity: 58,
        pricePerHour: 45),
    Car(model: 'hook Gr', distance: 970, fuelCapacity: 88, pricePerHour: 15),
    Car(model: 'Foroom Grp', distance: 840, fuelCapacity: 53, pricePerHour: 85),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Text('error: ${state.message}'),
            );
          }
          return Container(
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
