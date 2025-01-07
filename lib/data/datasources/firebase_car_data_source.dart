import 'package:car_project/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  // Existing method to fetch cars
  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }

  // Add this method to add a car to Firestore
  Future<void> addCar(Car car) async {
    await firestore.collection('cars').add({
      'model': car.model,
      'distance': car.distance,
      'fuelCapacity': car.fuelCapacity,
      'pricePerHour': car.pricePerHour,
    });
  }
}