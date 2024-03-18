import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

import '../data/models/library_model.dart';

class SingleCategoryScreen extends StatefulWidget {
  const SingleCategoryScreen({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();
  TextEditingController bookPriceController = TextEditingController();
  TextEditingController bookRateController = TextEditingController();
  TextEditingController bookImageController = TextEditingController();

  List<BookModel> listForCategory = [];
  BookModel bookModel = BookModel.initialValue;

  @override
  Widget build(BuildContext context) {
    final list = context.watch<BookViewModel>().allBooks;
    listForCategory =
        list.where((element) => element.categoryId == widget.getIndex).toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 10,
                          right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Add Book",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (v) {
                              bookModel.copyWith(name: v);
                            },
                            controller: bookNameController,
                            cursorColor: Colors.black.withOpacity(.8),
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              labelText: "Book name",
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            onChanged: (value) {
                              bookModel.copyWith(auth: value);
                            },
                            controller: bookAuthorController,
                            cursorColor: Colors.black.withOpacity(.8),
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              labelText: "Book Author",
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            onChanged: (value) {
                              bookModel.copyWith(price: 12);
                            },
                            controller: bookPriceController,
                            cursorColor: Colors.black.withOpacity(.8),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              labelText: "Book Price",
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            onChanged: (v) {
                              bookModel.copyWith(rate: 12);
                            },
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: bookRateController,
                            cursorColor: Colors.black.withOpacity(.8),
                            autofocus: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              labelText: "Book Rate",
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(.6)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              onPressed: () {
                                context.read<BookViewModel>().addBook(
                                    bookModel.copyWith(
                                        name: bookNameController.value.text,
                                        auth: bookAuthorController.text,
                                        imageUrl:
                                            "https://www.mobf.org/wp-content/uploads/2020/12/my-own-book-favicion.png",
                                        categoryId: widget.getIndex,
                                        rate: double.parse(
                                            bookRateController.text),
                                        price: double.parse(
                                            bookPriceController.text)));

                                Navigator.pop(context);
                                context.read<BookViewModel>().getAllBooks();
                                listForCategory = list
                                    .where((element) =>
                                        element.categoryId == widget.getIndex)
                                    .toList();

                                Fluttertoast.showToast(
                                    msg: "Success",
                                    backgroundColor: Colors.green,
                                    gravity: ToastGravity.TOP);
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.blue,
        title: const Text(
          "All Books ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      //https://www.mobf.org/wp-content/uploads/2020/12/my-own-book-favicion.png
      body: ListView(
        children: [
          ...List.generate(
            listForCategory.length,
            (index) {
              //  int index = listForCategory.length - indexT - 1;
              return Column(
                children: [
                  ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: listForCategory[index].imageUrl,
                      width: 70,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {},
                    title: Text(listForCategory[index].name),
                    subtitle: Text(listForCategory[index].auth),
                    trailing: Text(
                      "${listForCategory[index].price} \$",
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
