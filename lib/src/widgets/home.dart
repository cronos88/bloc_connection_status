import 'package:connectivity_example/src/navigation/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose an option'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.providerExample),
              child: const Text(
                'Provider Example (ChangeNotifier)',
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.blocExample),
              child: const Text(
                'Flutter Bloc Example (Cubit)',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
