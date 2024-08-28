enum ComicError { notFound, unauthorized, serverError, unknow }

/// Nos permite controlar de mejor forma las excepciones que puedan surgir dentro
/// del proyecto
class ComicExceptionError implements Exception {
  final ComicError error;
  final String message;
  ComicExceptionError(this.error, this.message);

  @override
  String toString() => "ComicExceptionError $message";
}
