// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class Event {
  const Event();
}

//event that indication the auth service is working
class EventInitialize extends Event {
  const EventInitialize();
}

//sending verification email
class EventSendEmail extends Event {
  const EventSendEmail();
}

//Check for user registration
class EventRegister extends Event {
  final String email;
  final String password;
  const EventRegister(this.email, this.password);
}

//Event the user needs to register
class EventNeedsRegister extends Event {
  const EventNeedsRegister();
}

//User is trying to log in
class EventLogin extends Event {
  final String email;
  final String password;
  const EventLogin(this.email, this.password);
}

//Event of password reset
class EventResetPassword extends Event {
  final String? email;
  const EventResetPassword({this.email});
}

//Event of user logout
class EventLogout extends Event {
  const EventLogout();
}
