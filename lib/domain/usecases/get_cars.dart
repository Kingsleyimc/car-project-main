import 'package:car_project/data/models/car.dart';
import 'package:car_project/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
   return await repository.fetchCars();
  }
}
