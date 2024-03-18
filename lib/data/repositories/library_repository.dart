import 'package:library_app/data/models/library_model.dart';
import 'package:library_app/data/network/api_provider.dart';

import '../response/network_response.dart';

class BookRepository {
  Future<NetworkResponse> getAllInfo() => ApiProvider.getAllBookInfo();

  Future<NetworkResponse> postBookInfo(BookModel bookModel) =>
      ApiProvider.postSchoolInfo(bookModel);

  Future<NetworkResponse> deleteBookInfo(String uuId) =>
      ApiProvider.deleteBookInfo(uuId);

  Future<NetworkResponse> updateBookInfo(BookModel bookModel) =>
      ApiProvider.updateBookInfo(bookModel);
}
