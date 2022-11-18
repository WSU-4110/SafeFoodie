import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get logout_button => 'Log out';

  @override
  String get note => 'Note';

  @override
  String get cancel => 'Cancel';

  @override
  String get yes => 'Yes';

  @override
  String get delete => 'Delete';

  @override
  String get ok => 'OK';

  @override
  String get login => 'Login';

  @override
  String get verify_email => 'Verify email';

  @override
  String get register => 'Register';

  @override
  String get restart => 'Restart';

  @override
  String get delete_list_prompt => 'Are you sure you want to delete this list?';

  @override
  String get generic_error_prompt => 'An error occurred';

  @override
  String get logout_dialog_prompt => 'Are you sure you want to log out?';

  @override
  String get password_reset => 'Password reset';

  @override
  String get password_reset_dialog_prompt => 'We have now sent you a password reset link. Please check your email for more information.';

  @override
  String get login_error_cannot_find_user => 'Cannot find a user with the entered email!';

  @override
  String get login_error_wrong_credentials => 'Wrong email or password';

  @override
  String get login_error_auth_error => 'Authentication error';

  @override
  String get login_view_forgot_password => 'Forgot Password';

  @override
  String get login_view_not_registered_yet => 'Not registered yet? Register here!';

  @override
  String get email_text_field_placeholder => 'Enter your email here';

  @override
  String get password_text_field_placeholder => 'Enter your password here';

  @override
  String get forgot_password => 'Forgot Password';

  @override
  String get forgot_password_view_generic_error => 'We could not process your request. Please make sure that you are a registered user, or if not, register a user now by going back one step.';

  @override
  String get forgot_password_view_prompt => 'If you forgot your password, simply enter your email and we will send you a password reset link.';

  @override
  String get forgot_password_view_send_me_link => 'Send me password reset link';

  @override
  String get forgot_password_view_back_to_login => 'Back to login page';

  @override
  String get register_error_weak_password => 'This password is not secure enough. Please choose another password!';

  @override
  String get register_error_email_already_in_use => 'This email is already registered to another user. Please choose another email!';

  @override
  String get register_error_generic => 'Failed to register. Please try again later!';

  @override
  String get register_error_invalid_email => 'The email address you entered appears to be invalid. Please try another email address!';

  @override
  String get register_view_already_registered => 'Already registered? Login here!';

  @override
  String get verify_email_view_prompt => 'We\'ve sent you an email verification. Please open it to verify your account. If you haven\'t received a verification email yet, press the button below!';

  @override
  String get verify_email_send_email_verification => 'Send email verification';
}
