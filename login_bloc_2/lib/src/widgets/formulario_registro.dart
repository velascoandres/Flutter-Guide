import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/blocs/registro_bloc/registro_bloc.dart';
import 'package:login_bloc_2/src/funciones/camposFormulario.dart';
import 'package:login_bloc_2/src/funciones/utilitarios.dart';
import 'package:login_bloc_2/src/modelos/usuario_model.dart';

class FormularioRegistro extends StatefulWidget {
  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  RegistroBloc _registroBloc;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _fechaController = TextEditingController();
  final _telefonoController = TextEditingController();
  List<TextEditingController> listaControladores;

  @override
  void initState() {
    super.initState();
    _registroBloc = BlocProvider.of<RegistroBloc>(context);
    listaControladores = [
      _emailController,
      _passwordController,
      _nombresController,
      _apellidosController,
      _fechaController,
      _telefonoController,
    ];
  }

  _escucharEmail(String correo) {
    _registroBloc.add(CambioCorreo(correo: correo));
  }

  _escucharPassword(String password) {
    _registroBloc.add(CambioPassword(password: password));
  }

  _escucharTelefono(String telefono) {
    _registroBloc.add(CambioTelefono(telefono: telefono));
  }

  _escucharNombres(String nombres) {
    _registroBloc.add(CambioNombres(nombres: nombres));
  }

  _escucharApellidos(String apellidos) {
    _registroBloc.add(CambioApellidos(apellidos: apellidos));
  }

  _escucharFecha(String fechaNacimiento) {
    _registroBloc.add(CambioFechaNacimiento(fechaNacimiento: fechaNacimiento));
  }

  bool estaLlenoformulario() {
    return listaControladores.every(
      (TextEditingController controlador) {
        return controlador.text.isNotEmpty;
      },
    );
  }

  _presionarBotonRegistrar() {
    Usuario usuario = new Usuario(
      correo: _emailController.text,
      nombres: _nombresController.text,
      apellidos: _apellidosController.text,
      telefono: _telefonoController.text,
      fechaNacimiento: _fechaController.text,
    );
    _registroBloc.add(
      PresionadoBotonRegistrado(
        usuario: usuario,
      ),
    );
  }

  Widget _generarBotonSubmit(RegistroState state) {
    return RaisedButton(
      onPressed: estaHabilitadoBotonRegistrar(state) ? _presionarBotonRegistrar : null,
      child: Text('Registrar'),
      color: Colors.greenAccent,
    );
  }

  bool estaHabilitadoBotonRegistrar(RegistroState state) {
    return state.estaFormularioValido &&
        estaLlenoformulario() &&
        !state.estaConsultando;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistroBloc, RegistroState>(
      listener: (BuildContext context, RegistroState state) {
        if (state.estaConsultando) {
          mostrarSnackBar(context: context, mensaje: 'Registrando...');
        }
        if (state.estaExitoso) {
          BlocProvider.of<AuthBloc>(context).add(Logeado());
        }

        if (state.estaFallido) {
          mostrarSnakBarError(context);
        }
      },
      child: BlocBuilder<RegistroBloc, RegistroState>(
          builder: (BuildContext context, RegistroState state) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: <Widget>[
                generarCampoCorreo(
                  valorEstado: state.emailValido,
                  listenerCb: _escucharEmail,
                  controlador: _emailController,
                ),
                generarCampoPassword(
                  valorEstado: state.passwordValido,
                  listenerCb: _escucharPassword,
                  controlador: _passwordController,
                ),
                generarCampoNumerico(
                  valorEstado: state.telefonoValido,
                  textoLabel: 'Telefono',
                  textoAyuda: 'Ingrese su número de telefono',
                  listenerCb: _escucharTelefono,
                  controlador: _telefonoController,
                ),
                generarCampoTexto(
                  listenerCb: _escucharNombres,
                  textoAyuda: 'Ingrese sus nombres',
                  textoLabel: 'Nombres',
                  valorEstado: state.nombresValidos,
                  controlador: _nombresController,
                ),
                generarCampoTexto(
                  listenerCb: _escucharApellidos,
                  textoAyuda: 'Ingrese sus apellidos',
                  textoLabel: 'Apellidos',
                  valorEstado: state.apellidosValidos,
                  controlador: _apellidosController,
                ),
                generarCampoFecha(
                  context: context,
                  listenerCb: _escucharFecha,
                  textoAyuda: 'Ingrese su fecha de nacimiento',
                  textoLabel: 'Apellidos',
                  valorEstado: state.fechaNacimientoValida,
                  controlador: _fechaController,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                _generarBotonSubmit(state),
              ],
            ),
          ),
        );
      }),
    );
  }
}
