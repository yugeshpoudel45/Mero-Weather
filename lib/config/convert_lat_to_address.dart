import 'dart:developer';
import 'package:geocoding/geocoding.dart';

Future<String> convertLatitudeToAddress(
    double latitude, double longitude) async {
  String address = '';
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    // log("Placemarks: ${placemarks.first}");
    address = placemarks.first.subLocality.toString();
  } catch (e) {
    log("Exception caught: $e");
  }
  return address;
}
