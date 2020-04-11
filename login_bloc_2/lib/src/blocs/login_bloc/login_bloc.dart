import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositorio authRepositorio;
  final AuthBloc authBloc;

  LoginBloc({
    @required this.authRepositorio,
    @required this.authBloc,
  })  : assert(authRepositorio != null),
        assert(authBloc != null);

  @override
  LoginState get initialState => LoginInicio();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent evento,
  ) async* {
    if (evento is BotonLoginPresionado){
      yield LoginCargando();
      try{
        final token = await authRepositorio
        .autenticar(nombreUsuario: evento.nombreUsuario, password: evento.password);
        authBloc.add(Logeado(token: token));
      }catch(error){
        print(error);
        yield LoginFallido(error: error.toString());
      }
    }
  }
}
