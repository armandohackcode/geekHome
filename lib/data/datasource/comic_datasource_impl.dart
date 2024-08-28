import 'package:appgeekhome/domain/datasource/comic_datasource.dart';
import 'package:appgeekhome/domain/models/comic_detail.dart';
import 'package:appgeekhome/domain/models/comic_vine.dart';
import 'package:appgeekhome/domain/repository/data_repository.dart';

class ComicDatasourceImpl implements ComicDatasource {
  final DataRepository repository;
  ComicDatasourceImpl(this.repository);
  @override
  Future<List<ComicVine>> getData({required int limit, required int offset}) {
    return repository.getData(limit: limit, offset: offset);
  }

  @override
  Future<ComicDetail> getDetail({required String url}) {
    return repository.getDetail(url: url);
  }
}
