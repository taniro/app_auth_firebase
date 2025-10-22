import 'package:app_auth_firebase/services/store_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../services/auth_service.dart';


class ConfigureProviders {

  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {

    final authService = AuthService();
    final storeService = StoreService();

    return ConfigureProviders(providers: [
      Provider<AuthService>.value(value: authService),
      Provider<StoreService>.value(value: storeService)
    ]);
  }
}