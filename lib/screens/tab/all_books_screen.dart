import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/models/library_model.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  List<BookModel> list = [];
  @override
  @override
  Widget build(BuildContext context) {
    list = context.watch<BookViewModel>().allBooks;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "All Books ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(
            list.length,
            (index) {
              //int index = list.length - indexT - 1;
              print(list[index].imageUrl);
              return Column(
                children: [
                  ListTile(
                    onLongPress: () {
                      context
                          .read<BookViewModel>()
                          .deleteBook(list[index].stringUuId);
                    },
                    leading: CachedNetworkImage(
                      imageUrl: list[index].imageUrl,
                      width: 70,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {},
                    title: Text(list[index].name),
                    subtitle: Text(list[index].auth),
                    trailing: Text(
                      "${list[index].price} \$",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black.withOpacity(.2),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
