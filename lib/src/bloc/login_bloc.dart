
import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  // los rx no son compatibles con los StreamController por lo que debo usar BehaviorSubject que trae
  // el broadcast por defecto funcionando
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // recuperar los datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);  
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword); 

  // union de streams para habilitar o deshabilitar el boton
  Stream<bool> get formValidationStream => 
    CombineLatestStream.combine2(emailStream, passwordStream, (e,p) => true);

  // insert valores en el stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // obtener ultimo valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    // es buena practica tener esta validacion por si el controller esta null
    _emailController?.close();
    _passwordController?.close();
  }

}