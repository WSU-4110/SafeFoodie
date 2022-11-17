import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get logout_button => 'Cerrar sesión';

  @override
  String get note => 'Nota';

  @override
  String get cancel => 'Cancelar';

  @override
  String get yes => 'Sí';

  @override
  String get delete => 'Borrar';

  @override
  String get ok => 'OK';

  @override
  String get login => 'Acceso';

  @override
  String get verify_email => 'Verificar correo electrónico';

  @override
  String get register => 'Registro';

  @override
  String get restart => 'Reiniciar';

  @override
  String get delete_list_prompt => '¿Está seguro de que desea eliminar esta lista?';

  @override
  String get generic_error_prompt => 'Ocurrió un error';

  @override
  String get logout_dialog_prompt => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String get password_reset => 'Restablecimiento de contraseña';

  @override
  String get password_reset_dialog_prompt => 'Ahora le hemos enviado un enlace de restablecimiento de contraseña. Por favor revise su correo electrónico para más información.';

  @override
  String get login_error_cannot_find_user => 'No se puede encontrar un usuario con el correo electrónico ingresado!';

  @override
  String get login_error_wrong_credentials => 'Correo o contraseña equivocada';

  @override
  String get login_error_auth_error => 'Error de autenticación';

  @override
  String get login_view_forgot_password => 'Forgot Password';

  @override
  String get login_view_not_registered_yet => 'Not registered yet? Register here!';

  @override
  String get email_text_field_placeholder => 'Enter your email here';

  @override
  String get password_text_field_placeholder => 'Enter your password here';

  @override
  String get forgot_password => 'Has olvidado tu contraseña';

  @override
  String get forgot_password_view_generic_error => 'No pudimos procesar su solicitud. Por favor, asegúrese de que es un usuario registrado, o si no, regístrese ahora retrocediendo un paso.';

  @override
  String get forgot_password_view_prompt => 'Si olvidó su contraseña, simplemente ingrese su correo electrónico y le enviaremos un enlace para restablecer la contraseña.';

  @override
  String get forgot_password_view_send_me_link => 'Enviarme enlace de restablecimiento de contraseña';

  @override
  String get forgot_password_view_back_to_login => 'Volver a la página de inicio de sesión';

  @override
  String get register_error_weak_password => 'Esta contraseña no es lo suficientemente segura. ¡Elige otra contraseña!';

  @override
  String get register_error_email_already_in_use => 'Este correo electrónico ya está registrado para otro usuario. ¡Elige otro correo electrónico!';

  @override
  String get register_error_generic => 'Fallo el registro. ¡Por favor, inténtelo de nuevo más tarde!';

  @override
  String get register_error_invalid_email => 'La dirección de correo electrónico que ingresaste parece no ser válida. Por favor, intente con otra dirección de correo electrónico.';

  @override
  String get register_view_already_registered => '¿Ya registrado? ¡Entre aquí!';

  @override
  String get verify_email_view_prompt => 'Te hemos enviado un correo electrónico de verificación. Ábralo para verificar su cuenta. Si aún no ha recibido un correo electrónico de verificación, presione el botón a continuación.';

  @override
  String get verify_email_send_email_verification => 'Enviar verificación de correo electrónico';
}
