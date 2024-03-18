import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/screens/info_for_single_category.dart';
import 'package:library_app/utils/constants/app_constants.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<BookViewModel>().allBooks;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Category ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(
            AppConstants.booksCategory.length,
            (indexT) {
              int index = indexT;
              int count = 0;
              final ls = list
                  .map((e) => e.categoryId == AppConstants.booksId[index])
                  .toList();
              for (int i = 0; i < ls.length; i++) {
                if (ls[i] == true) {
                  count += 1;
                }
              }
              return Column(
                children: [
                  ListTile(
                    trailing: Text(
                      "$count",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: AppConstants.booksCategoryImages[index],
                        width: 70,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SingleCategoryScreen(
                          getIndex: index,
                        );
                      }));
                    },
                    title: Text(AppConstants.booksCategory[index]),
                    subtitle: Text(AppConstants.booksCategory[index]),
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
