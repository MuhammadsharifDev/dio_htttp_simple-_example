import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_example/features/home/data/model/get_user_response.dart';
import 'package:dio_example/features/home/domain/home_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetUsersEvent>(_getUsers);
  }

  final _homeRepository = HomeRepository();

  Future<void> _getUsers(GetUsersEvent event,
      Emitter<HomeState> emit) async {
    final result = await _homeRepository.getUsers();

    emit(state.copyWith(
      usersList: result,
    ));
  }
}
