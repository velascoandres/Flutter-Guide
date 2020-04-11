import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registro_event.dart';
part 'registro_state.dart';

class RegistroBloc extends Bloc<RegistroEvent, RegistroState> {
  @override
  RegistroState get initialState => RegistroInitial();

  @override
  Stream<RegistroState> mapEventToState(
    RegistroEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
