import 'package:appgeekhome/data/datasource/comic_datasource_impl.dart';
import 'package:appgeekhome/data/repository/comic_repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../domain/bloc/blocs.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ComicRepositoryImpl>(() => ComicRepositoryImpl());

  getIt.registerLazySingleton<ComicDatasourceImpl>(
      () => ComicDatasourceImpl(getIt<ComicRepositoryImpl>()));

  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt<ComicDatasourceImpl>()));

  getIt.registerFactory<ComicDetailBloc>(
      () => ComicDetailBloc(getIt<ComicDatasourceImpl>()));
}
