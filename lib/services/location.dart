import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async
  {
    Position ? position;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try{
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }

}