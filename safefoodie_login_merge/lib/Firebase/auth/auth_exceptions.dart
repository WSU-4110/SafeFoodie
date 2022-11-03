//login exception

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//register exception
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//generic
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
