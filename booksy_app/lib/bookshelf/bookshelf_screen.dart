import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({super.key});

  final List<Book> _books = const [
    Book(
      1,
      "Essentialism: The disciplined pursuit of less",
      "Greg Mckeown",
      "Have you ever found yourself struggling with information overload?",
      "assets/images/book1.png",
    ),
    Book(
        2,
        "Einstein: His Life and Universe",
        "Walter Isaacson",
        "Einstein was a rebel and nonconformist from boyhood days.",
        "assets/images/book2.jpeg"),
    Book(
        3,
        "Love People, Use Things: Because the Opposite Never Works",
        "Ryan Nicodemus",
        "Imagine a life with less:",
        "assets/images/book3.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    if (_books.isEmpty) {
      return Center(
        child: Text(
          "Aún no tienes ningún libro en tu estante.",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return BookCoverItem(_books[index]);
        },
      ),
    );
  }
}

class BookCoverItem extends StatelessWidget {
  final Book _book;
  const BookCoverItem(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink.image(
        fit: BoxFit.fill,
        image: AssetImage(_book.coverURL),
      ),
    );
  }
}
