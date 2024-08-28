part of 'home_bloc.dart';

class HomeLoaded extends Equatable {
  final List<ComicVine> comics;
  final bool loading;
  final bool loadingMore;
  final String? errorMs;

  const HomeLoaded(
      {required this.comics,
      required this.loading,
      required this.loadingMore,
      this.errorMs});

  @override
  List<Object?> get props => [comics, loading, loadingMore, errorMs];

  HomeLoaded copyWith({
    List<ComicVine>? comics,
    bool? loading,
    bool? loadingMore,
    String? errorMs,
  }) =>
      HomeLoaded(
          comics: comics ?? this.comics,
          loading: loading ?? this.loading,
          loadingMore: loadingMore ?? this.loadingMore,
          errorMs: errorMs ?? this.errorMs);
}
