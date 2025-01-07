import 'package:car_project/Presentation/bloc/car_bloc.dart';
import 'package:car_project/data/datasources/firebase_car_data_source.dart';
import 'package:car_project/data/repositories/car_repository_impl.dart';
import 'package:car_project/domain/repositories/car_repository.dart';
import 'package:car_project/domain/usecases/get_cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    // Register Firestore instance
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    
    // Register data source
    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    
    // Register repository
    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    
    // Register use case
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    
    // Register CarBloc
    getIt.registerFactory(() => CarBloc(
          getCars: getIt<GetCars>(),
          datasource: getIt<FirebaseCarDataSource>(), // Fix here
    ));
  } catch (e) {
    throw e;
  }
}
