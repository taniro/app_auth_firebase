import 'package:app_auth_firebase/services/app/fire_storage_service.dart';
import 'package:app_auth_firebase/services/app/geolocator_service.dart';
import 'package:app_auth_firebase/services/firebase/storage_service.dart';
import 'package:app_auth_firebase/services/firebase/firestore_database_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../services/firebase/auth_service.dart';


class ConfigureProviders {

  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {

    final authService = AuthService();
    final storeService = FirestoreDatabaseService();
    final fileStorageService = FileStorageService();
    final geoLocatorService = GeoLocatorService();
    final firebaseStorageService = StorageService();

    return ConfigureProviders(providers: [
      Provider<AuthService>.value(value: authService),
      Provider<FirestoreDatabaseService>.value(value: storeService),
      Provider<FileStorageService>.value(value: fileStorageService),
      Provider<GeoLocatorService>.value(value: geoLocatorService),
      Provider<StorageService>.value(value: firebaseStorageService)
    ]);
  }
}