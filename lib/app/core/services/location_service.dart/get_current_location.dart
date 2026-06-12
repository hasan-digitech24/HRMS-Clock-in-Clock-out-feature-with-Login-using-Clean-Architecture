import 'package:geolocator/geolocator.dart';
import 'package:login_api/app/core/exceptions/exceptions.dart';
import 'package:login_api/app/core/utils/app_snack_bar.dart';

class LocationService {
  
static Future<Position> getCurrentLocation() async {

// This check isLocationServiceEnabled, gps location is on or not
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

   if (!serviceEnabled) {
    throw LocationServiceException('Location services are disabled.');
  
  }

  // if (!serviceEnabled) {
  //   await Geolocator.openLocationSettings();
  //     serviceEnabled = await Geolocator.isLocationServiceEnabled();

  // if (!serviceEnabled) {
  //   throw LocationServiceException('Location services are disabled.');
  // }
  // }
  
// This check checkPermission user gives location permission or not
  LocationPermission permission = await Geolocator.checkPermission();

   if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    

    if (permission == LocationPermission.denied) {
      throw LocationPermissionException("Location permissions are denied.");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // await Geolocator.openAppSettings();
    throw LocationPermissionException("Location permissions are permanently denied. Kindly enable in app settings");
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}


}
