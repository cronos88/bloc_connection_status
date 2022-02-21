import 'package:connectivity_example/src/provider/connection_status_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => ConnectionStatusModel(),
      child: const ProviderExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The device has access to the Internet:'),
            Consumer<ConnectionStatusModel>(builder: (_, model, __) {
              return Text(
                model.isOnline ? 'True' : 'False',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
    );
  }
}
