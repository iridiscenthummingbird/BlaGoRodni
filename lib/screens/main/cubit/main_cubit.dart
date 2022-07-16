import 'package:blagorodni/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.userRepository}) : super(MainInitial());
  final UserRepository userRepository;

  void logout() {
    userRepository.logout();
  }
}
