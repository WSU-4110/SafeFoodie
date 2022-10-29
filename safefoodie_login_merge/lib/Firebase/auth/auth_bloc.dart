import 'package:bloc/bloc.dart';
import 'package:safefoodie_login_merge/Firebase/auth/provider.dart';
import 'package:safefoodie_login_merge/Firebase/auth/event.dart';
import 'package:safefoodie_login_merge/Firebase/auth/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<Event, AuthState> {
  AuthBloc(Provider provider) : super(const StateUninitialized(loading: true)) {
    on<EventRegister>((event, emit) {
      emit(const StateRegistering(exception: null, loading: false));
    });

    //forgot password
    on<EventResetPassword>((event, emit) async {
      emit(const StateResetPassword(
          exception: null, sentEmail: false, loading: false));
      final email = event.email;
      if (email == null) {
        return;
      }

      emit(const StateResetPassword(
          exception: null, sentEmail: false, loading: true));

      bool sendEmail;
      Exception? exception;
      try {
        await provider.sendPasswordReset(toEmail: email);
        sendEmail = true;
        exception = null;
      } on Exception catch (e) {
        sendEmail = false;
        exception = e;
      }

      emit(StateResetPassword(
          exception: exception, sentEmail: sendEmail, loading: false));
    });
    //send email verification
    on<EventSendEmail>(
      (event, emit) async {
        await provider.sendEmailVerification();
        emit(state);
      },
    );

    //register event
    on<EventRegister>(
      (event, emit) async {
        final email = event.email;
        final password = event.password;
        try {
          await provider.createUser(email: email, password: password);
          await provider.sendEmailVerification();
          emit(const StateVerification(loading: false));
        } on Exception catch (e) {
          emit(StateRegistering(exception: e, loading: false));
        }
      },
    );

    //initialize event
    on<EventInitialize>(
      (event, emit) async {
        await provider.initialized();
        final user = provider.currentUser;
        if (user == null) {
          emit(const StateLoggedOut(exception: null, loading: false));
        } else if (!user.isVerified) {
          emit(StateLoggedIn(user: user, loading: false));
        }
      },
    );

    //Log in event
    on<EventLogin>(
      (event, emit) async {
        emit(const StateLoggedOut(
          exception: null,
          loading: true,
          loadingText: 'Please wait',
        ));
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.logIn(email: email, password: password);
          if (!user.isVerified) {
            emit(const StateLoggedOut(exception: null, loading: false));
            emit(const StateVerification(loading: false));
          } else {
            emit(const StateLoggedOut(exception: null, loading: false));
            emit(StateLoggedIn(user: user, loading: false));
          }
        } on Exception catch (e) {
          emit(StateLoggedOut(exception: e, loading: false));
        }
      },
    );

    //Log out event
    on<EventLogout>(
      (event, emit) async {
        try {
          await provider.logOut();
          emit(
            const StateLoggedOut(exception: null, loading: false),
          );
        } on Exception catch (e) {
          emit(StateLoggedOut(exception: e, loading: false));
        }
      },
    );
  }
}
