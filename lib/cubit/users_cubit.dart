import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/users_model.dart';
import '../repo/users_repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());

  onLoadProducts() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo.getUsers();
      emit(UsersLoadedState(data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
