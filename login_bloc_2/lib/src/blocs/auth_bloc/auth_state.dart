part of 'auth_bloc.dart';

// Estados de autentificacion
// ininicializada
// cargando --> esperar a guardar o borrar el token
// sinAutenticar
// autentificado


// Ejemplo:

// Si el estado de autentificacion fue ininicializada, el usuario puede estar viendo pantalla splash.
// Si el estado de autentificacion fue cargando, el usuario puede estar viendo una barra de progreso.
// Si el estado de autentificacion fue autentificado, el usuario debe estar en la pantalla de perfil o inicio.
// Si el estado de autentificacion fue sinAutenticar, el usuario debe estar en la pantalla de login.

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}
// Se define cada estado

// sinInicializar
class AuthSinInicializar extends AuthState {}

// cargando
class AuthCargando extends AuthState {}

// Autentificado 
class AuthAuntentificado extends AuthState {}

// sinAutenticar
class AuthSinAutentificar extends AuthState {}

// Confirmacion del correo
class AuthEsperandoConfirmacionCorreo extends AuthState {}


