import 'package:appgeekhome/domain/datasource/comic_datasource.dart';
import 'package:appgeekhome/domain/models/comic_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comic_detail_event.dart';
part 'comic_detail_state.dart';

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicLoaded> {
  final ComicDatasource comicDatasource;
  ComicDetailBloc(this.comicDatasource)
      : super(const ComicLoaded(
            comic: null, loading: false, errorMessage: null)) {
    on<LoadComicDetail>(_onLoadComicDetail);
  }

  Future<void> _onLoadComicDetail(
      LoadComicDetail event, Emitter<ComicLoaded> emit) async {
    try {
      emit(state.copyWith(loading: true, errorMessage: null));
      var res = await comicDatasource.getDetail(url: event.url);
      emit(state.copyWith(comic: res));
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(
          loading: false, errorMessage: "Failed to load comic detail"));
    }
  }
}
