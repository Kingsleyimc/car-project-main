import 'package:car_project/data/datasources/firebase_car_data_source.dart';
import 'package:car_project/data/models/car.dart';
import 'package:car_project/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource datasource;

  CarRepositoryImpl(this.datasource);

  @override
  Future<List<Car>> fetchCars() {
    return datasource.getCars();
  }
}
