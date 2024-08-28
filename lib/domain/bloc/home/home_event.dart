part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadComics extends HomeEvent {}

class LoadComicsMore extends HomeEvent {
  final int limit;
  final int offset;
  const LoadComicsMore({this.limit = 10, this.offset = 0});
}
