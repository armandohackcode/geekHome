import 'package:appgeekhome/domain/models/comic_detail.dart';
import 'package:appgeekhome/domain/models/comic_vine.dart';

abstract class ComicDatasource {
  Future<List<ComicVine>> getData({required int limit, required int offset});
  Future<ComicDetail> getDetail({required String url});
}
