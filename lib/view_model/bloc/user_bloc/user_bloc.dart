import 'package:flutter/material.dart';
import 'package:hashfi_task2_app/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/view_model/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;
  UserBloc({required this.userService}) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        final result = await userService.fetchUser();
        emit(UserLoaded(result));
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
