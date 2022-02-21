import 'package:connectivity_example/src/bloc/connection_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider(
      create: (_) => ConnectionStatusCubit(),
      child: const BlocExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The device has access to the Internet:'),
            BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
                builder: (_, state) {
              return Text(
                state == ConnectionStatus.online ? 'True' : 'False',
                style: Theme.of(context).textTheme.headline4,
              );
            })
          ],
        ),
      ),
    );
  }
}
