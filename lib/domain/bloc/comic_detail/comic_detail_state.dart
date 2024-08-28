part of 'comic_detail_bloc.dart';

class ComicLoaded extends Equatable {
  final ComicDetail? comic;
  final bool loading;
  final String? errorMessage;
  const ComicLoaded(
      {required this.comic, required this.loading, required this.errorMessage});

  @override
  List<Object?> get props => [comic, loading, errorMessage];

  ComicLoaded copyWith({
    ComicDetail? comic,
    bool? loading,
    String? errorMessage,
  }) =>
      ComicLoaded(
          comic: comic ?? this.comic,
          loading: loading ?? this.loading,
          errorMessage: errorMessage ?? this.errorMessage);
}
