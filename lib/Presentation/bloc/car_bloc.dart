import 'package:bloc/bloc.dart';
import 'package:car_project/Presentation/bloc/car_event.dart';
import 'package:car_project/Presentation/bloc/car_state.dart';
import 'package:car_project/data/datasources/firebase_car_data_source.dart';
import 'package:car_project/domain/usecases/get_cars.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;
  final FirebaseCarDataSource datasource;

  CarBloc({required this.getCars, required this.datasource}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });

    on<AddCar>((event, emit) async {
      try {
        await datasource.addCar(event.car);
        final cars = await getCars.call(); // Reload the list after adding
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
