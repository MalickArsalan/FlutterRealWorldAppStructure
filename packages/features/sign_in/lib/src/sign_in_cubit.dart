import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_state.dart';

// TODO: Create the Cubit.
// 4.7
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    // 4.8
    required this.userRepository,
  }) : super(
          // 4.9
          const SignInState(),
        );

  final UserRepository userRepository;
  // TODO: Take in UI events.
  void onEmailChanged(String newValue) {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final shouldValidate = previousEmailState.invalid;
    final newEmailState = shouldValidate
        ? Email.validated(newValue)
        : Email.unvalidated(newValue);

    final newScreenState = state.copyWith(email: newEmailState);
    emit(newScreenState);
  }

  void onEmailUnfocused() {
    final previousScreenState = state;
    final previousEmailState = previousScreenState.email;
    final previousEmailValue = previousEmailState.value;

    final newEmailState = Email.validated(previousEmailValue);
    final newScreenState = previousScreenState.copyWith(email: newEmailState);
    emit(newScreenState);
  }

  void onPasswordChanged(String newValue) {
    // TODO: Handle the user changing the value of the password field.
    // 4.10
    final previousScreenState = state;
    // 4.11
    final previousPasswordState = previousScreenState.password;

    final shouldValidate = previousPasswordState.invalid;
    // 4.12
    final newPasswordState = shouldValidate
        ? Password.validated(newValue)
        : Password.unvalidated(newValue);

    // TODO: Emit the new state.
    // 4.13
    final newScreenState = state.copyWith(password: newPasswordState);

    // 4.14
    emit(newScreenState);
  }

  void onPasswordUnfocussed() {
    // TODO: Handle the user taking the focus out of the password field.
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;

    // 4.15
    final previousPasswordValue = previousPasswordState.value;

    // 4.16
    final newPasswordValue = Password.validated(previousPasswordValue);

    // 4.17
    final newScreenState =
        previousScreenState.copyWith(password: newPasswordValue);

    emit(newScreenState);
  }

  void onSubmit() async {
    // TODO: Handle the submit button's tap.
    // 4.27
    final email = Email.validated(state.email.value);
    final password = Password.validated(state.password.value);

    // 4.28
    final isFormValid = Formz.validate([
      email,
      password,
    ]).isValid;

    // 4.29
    final newState = state.copyWith(
      email: email,
      password: password,
      // 4.30
      submissionStatus: isFormValid ? SubmissionStatus.inProgress : null,
    );

    // 4.31
    emit(newState);

    // TODO: Submit the data.
    // 4.32
    if (isFormValid) {
      try {
        // 4.33
        await userRepository.signIn(
          email.value,
          password.value,
        );

        // 4.34
        final newState = state.copyWith(
          submissionStatus: SubmissionStatus.success,
        );
        emit(newState);
      } catch (error) {
        final newState = state.copyWith(
          // 4.35
          submissionStatus: error is InvalidCredentialsException
              ? SubmissionStatus.invalidCredentialsError
              : SubmissionStatus.genericError,
        );
        emit(newState);
      }
    }
  }
}
