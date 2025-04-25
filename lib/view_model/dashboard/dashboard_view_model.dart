
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_minds/src/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dashboardViewModel =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int? _exchangeCurrentIndex = 0;
  bool _isDrawerOpen = false;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDragging = false;

  int get exchangeCurrentIndex => _exchangeCurrentIndex!;
  bool isObscure = false;
  int get currentIndex => _currentIndex;
  bool get isDrawerOpen =>_isDrawerOpen;
  String? country, state, locality,subLocality, latitude,longitude, formattedLocation, name, street;

  setPageIndex({int? selectedPageIndex}) {
    if (selectedPageIndex == 4) {
        openDrawer();
        notifyListeners();
    } else {
      _currentIndex = selectedPageIndex ?? 0;
      // logger.w("Tab");
    }
    notifyListeners();
  }
  setExchangePageIndex({int? selectedPageIndex}) {
    _exchangeCurrentIndex = selectedPageIndex ?? 0;
    notifyListeners();
    // getDeviceLocation();
  }

  loadDashboardAmountPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      isObscure = prefs.getBool('isObscure') ?? false;
      notifyListeners();
  }
  late SharedPreferences sharedPreferences;

  toggleObscure() async {

      isObscure = !isObscure;
      notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isObscure', isObscure);
     notifyListeners();

  }

  void openDrawer() {
      xOffset = 320.w;
      yOffset = 89.h;
      scaleFactor = 0.8;
      _isDrawerOpen =  true;
      notifyListeners();
  }

  void closeDrawer() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      _isDrawerOpen =  false;
      notifyListeners();

  }


  // Future<void> getDeviceLocation() async {
  //   final service = LocationService();
  //   // print(service);
  //   try {
  //     final locationData = await service.getLocation();
  //     if (locationData != null) {
  //       final placeMark =
  //       await service.getPlaceMark(locationData: locationData);
  //
  //       country = placeMark?.country ?? '';
  //       state = placeMark?.administrativeArea ?? '';
  //       locality = placeMark?.locality ?? '';
  //       subLocality = placeMark?.subAdministrativeArea ?? '';
  //       subLocality = placeMark?.subAdministrativeArea ?? '';
  //       latitude = locationData.latitude.toString() ?? '';
  //       longitude = locationData.longitude.toString() ?? '';
  //       name = placeMark?.name ?? ''; // Name of the place (e.g., building or street)
  //       street = placeMark?.street ?? ''; // Street or landmark
  //       // addressPlace = placeMark?.country.toString();   addressPlacemarks.reversed.last.locality.toString();
  //       DummyData.city = "$locality";
  //       DummyData.state = "$state";
  //       DummyData.longitude = "$longitude";
  //       DummyData.latitude = "$latitude";
  //       formattedLocation =
  //           "$name, $street, $subLocality, $locality, $state,  (Lat: $latitude, Long: $longitude)"; // Concatenate the fields
  //
  //
  //       logger.wtf(' longitude: $longitude ,  latitude $latitude');
  //       // DummyData.userLatitude = locationData.latitude!;
  //       // DummyData.userLongitude = locationData.longitude!;
  //
  //       //logger.t('${DummyData.city} ${DummyData.state}',);
  //       // logger.t(DummyData.userLatitude);
  //       // logger.t(DummyData.userLongitude);
  //
  //       //print('${locationData.latitude!}  + ' ' + ${locationData.longitude!}');
  //       notifyListeners();
  //       // fetchVendorsNearYou();
  //     }
  //   } on Exception catch (e) {
  //     logger.e(e);
  //   }
  // }


}
