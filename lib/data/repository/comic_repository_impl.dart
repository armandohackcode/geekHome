import 'package:appgeekhome/config/api/api_config.dart';
import 'package:appgeekhome/config/errors/comic_exception_error.dart';
import 'package:appgeekhome/domain/models/comic_detail.dart';
import 'package:appgeekhome/domain/models/comic_vine.dart';
import 'package:appgeekhome/domain/models/response_api.dart';
import 'package:appgeekhome/domain/repository/data_repository.dart';
import 'package:http/http.dart' as http;

class ComicRepositoryImpl implements DataRepository {
  @override
  Future<List<ComicVine>> getData(
      {required int limit, required int offset}) async {
    try {
      print("ejecutando");
      var url =
          "${baseUrl}movies/?api_key=$apiKey&format=json&sort=date_added:desc&limit=$limit&offset=$offset";
      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          return responseApiFromJson(response.body).results;
        case 401:
          throw ComicExceptionError(ComicError.unauthorized, "No autorizado");
        case 404:
          throw ComicExceptionError(ComicError.notFound, "La ruta no existe");
        case 500:
          throw ComicExceptionError(
              ComicError.serverError, "El Servidor no responde");
        default:
          throw ComicExceptionError(ComicError.unknow, "Error desconocido");
      }
    } catch (e) {
      print(e);
      throw ComicExceptionError(ComicError.unknow, e.toString());
    }
  }

  @override
  Future<ComicDetail> getDetail({required String url}) async {
    try {
      print("ejecutando");
      var uri = "$url?api_key=$apiKey&format=json";
      var response = await http.get(Uri.parse(uri));
      print(response.statusCode);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          return responseApiDetailFromJson(response.body).results;
        case 401:
          throw ComicExceptionError(ComicError.unauthorized, "No autorizado");
        case 404:
          throw ComicExceptionError(ComicError.notFound, "La ruta no existe");
        case 500:
          throw ComicExceptionError(
              ComicError.serverError, "El Servidor no responde");
        default:
          throw ComicExceptionError(ComicError.unknow, "Error desconocido");
      }
    } catch (e) {
      print(e);
      throw ComicExceptionError(ComicError.unknow, e.toString());
    }
  }
}
