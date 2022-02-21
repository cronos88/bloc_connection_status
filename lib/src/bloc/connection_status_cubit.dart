import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectionSubscription;

  ConnectionStatusCubit() : super(ConnectionStatus.online) {
    _connectionSubscription = _connectivity.onConnectivityChanged
        .listen((_) => _checkInternetConnection());
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        emit(ConnectionStatus.online);
      } else {
        emit(ConnectionStatus.offline);
      }
    } on SocketException catch (_) {
      emit(ConnectionStatus.offline);
    }
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }
}

enum ConnectionStatus {
  online,
  offline,
}
