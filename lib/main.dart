import 'package:flutter/material.dart';
import 'package:library_app/data/models/library_model.dart';
import 'package:library_app/data/repositories/library_repository.dart';
import 'package:library_app/screens/tab/tab_box.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  BookRepository bookRepository = BookRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookViewModel(
            bookRepository: bookRepository,
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabBox(),
    );
  }
}
