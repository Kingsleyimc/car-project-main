import 'package:car_project/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
