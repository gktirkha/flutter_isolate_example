import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/api_cubit.dart';
import 'list_page.dart';
import 'loading_util/loading.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiLoading) {
          LoadingScreen.instance().show(context: context, text: 'Loading');
        } else {
          LoadingScreen.instance().hide();
        }
        if (state is ApiFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed'),
            ),
          );
        }
        if (state is ApiSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ListPage(results: context.read<ApiCubit>().res),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<ApiCubit>().callApi();
              },
              child: const Text('Do Task'),
            ),
          ),
        ),
      ),
    );
  }
}
