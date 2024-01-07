part of 'sign_in_cubit.dart';

// TODO: Create your state class.

enum SubmissionStatus {
  /// Used when the form has not been sent yet.
  idle,

  /// Used to disable all buttons and add a progress indicator to the main one.
  inProgress,

  /// Used to close the screen and navigate back to the caller screen.
  success,

  /// Used to display a generic snack bar saying that an error has occurred, e.g., no internet connection.
  genericError,

  /// Used to show a more specific error telling the user they got the email and/or password wrong.
  invalidCredentialsError,
}

class SignInState extends Equatable {
  const SignInState(
      {
      // 1
      this.email = const Email.unvalidated(),
      this.password = const Password.unvalidated(),
      // 2
      this.submissionStatus});

  final Email email;
  final Password password;
  final SubmissionStatus? submissionStatus;

  // 3
  SignInState copyWith(
      {Email? email, Password? password, SubmissionStatus? submissionStatus}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      submissionStatus: submissionStatus,
    );
  }

  // 4
  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
        submissionStatus,
      ];
}
