import 'package:appgeekhome/domain/datasource/comic_datasource.dart';
import 'package:appgeekhome/domain/models/comic_vine.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeLoaded> {
  final ComicDatasource comicDatasource;
  int limitCurrent = 10;
  int offsetCurrent = 0;
  bool isLoading = false;
  HomeBloc(this.comicDatasource)
      : super(const HomeLoaded(
            comics: [], loading: false, loadingMore: false, errorMs: null)) {
    on<LoadComics>(_onLoadComics);
    on<LoadComicsMore>(_onLoadComicsMore);
  }

  Future<void> _onLoadComics(LoadComics event, Emitter<HomeLoaded> emit) async {
    emit(state.copyWith(loading: true, errorMs: null));
    try {
      limitCurrent = 10;
      offsetCurrent = 0;
      final comics =
          await comicDatasource.getData(limit: limitCurrent, offset: 0);
      emit(state.copyWith(comics: comics));
      offsetCurrent = limitCurrent;
      emit(state.copyWith(loading: false, errorMs: null));
    } catch (error) {
      emit(state.copyWith(loading: false, errorMs: 'Failed to load comics'));
    }
  }

  Future<void> _onLoadComicsMore(
      LoadComicsMore event, Emitter<HomeLoaded> emit) async {
    emit(state.copyWith(loadingMore: true, errorMs: null));
    try {
      print("=======Ejecutado=========");
      if (isLoading) return;
      isLoading = true;

      final comics = await comicDatasource.getData(
          limit: limitCurrent, offset: offsetCurrent);
      var currentComics = state.comics + comics;

      emit(state.copyWith(comics: currentComics));
      isLoading = false;

      offsetCurrent += limitCurrent;

      emit(state.copyWith(loadingMore: false, errorMs: null));
    } catch (error) {
      emit(
          state.copyWith(loadingMore: false, errorMs: 'Failed to load comics'));
    }
  }
}
