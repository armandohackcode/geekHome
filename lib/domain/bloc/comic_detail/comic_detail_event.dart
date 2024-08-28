part of 'comic_detail_bloc.dart';

sealed class ComicDetailEvent extends Equatable {
  const ComicDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadComicDetail extends ComicDetailEvent {
  final String url;
  const LoadComicDetail({required this.url});
  @override
  List<Object> get props => [url];
}
