import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/api_cubit.dart';
import 'home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiCubit>(
      create: (context) => ApiCubit(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
