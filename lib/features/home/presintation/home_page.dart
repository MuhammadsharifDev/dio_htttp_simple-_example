import 'dart:collection';

import 'package:dio_example/features/home/presintation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                        state.usersList?.results?[index].picture?.medium ?? ''),
                  ),
                ),
                title: Text(state.usersList?.results?[index].name?.first ?? ''),
                subtitle: Text(state.usersList?.results?[index].email ?? ''),
              );
            },),
        );
      },
    );
  }
}
