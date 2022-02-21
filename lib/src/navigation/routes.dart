import 'package:connectivity_example/src/widgets/bloc_example.dart';
import 'package:connectivity_example/src/widgets/home.dart';
import 'package:connectivity_example/src/widgets/provider_example.dart';
import 'package:flutter/material.dart';

class Routes {
  static const root = '/';
  static const providerExample = '/providerExample';
  static const blocExample = '/blocExample';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return _buildRoute(const HomePage());
      case providerExample:
        return _buildRoute(ProviderExample.create());
      case blocExample:
        return _buildRoute(BlocExample.create());
      default:
        throw Exception('Route does not exist');
    }
  }

  static MaterialPageRoute _buildRoute(Widget widget) =>
      MaterialPageRoute(builder: (_) => widget);
}
