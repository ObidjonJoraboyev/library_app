import 'package:flutter/material.dart';
import 'package:library_app/data/repositories/library_repository.dart';
import 'package:library_app/data/response/network_response.dart';

import '../data/models/library_model.dart';

class BookViewModel extends ChangeNotifier {
  List<BookModel> allBooks = [];
  String statusText = "";
  bool isLoading = false;

  final BookRepository bookRepository;

  BookViewModel({required this.bookRepository}) {getAllBooks();}

  Future<void> getAllBooks() async {
    _notify(true);
    NetworkResponse myResponse = await bookRepository.getAllInfo();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BookModel bookModel) async {
    _notify(true);
    NetworkResponse myResponse = await bookRepository.postBookInfo(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BookModel bookModel) async {
    _notify(true);
    NetworkResponse myResponse = await bookRepository.updateBookInfo(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook(String bookUUID) async {
    _notify(true);
    NetworkResponse myResponse = await bookRepository.deleteBookInfo(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
    } else {
      statusText = myResponse.errorText;
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
