import 'package:booksy_app/book_details/book_details_screen.dart';
import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        "assets/images/book2.jpeg"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: _books.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const HeaderWidget();
          }
          if (index == 1) {
            return ListItemHeader();
          }
          return ListItemBook(_books[index - 2]);
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/images/header.jpeg'),
    );
  }
}

class ListItemHeader extends StatelessWidget {
  const ListItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
        left: 5,
      ),
      child: const Text(
        "Últimos Libros",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ListItemBook extends StatelessWidget {
  final Book _book;

  const ListItemBook(this._book, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _openBookDetails(context, _book);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(_book.coverURL),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _book.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _book.author,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _book.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBookDetails(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookDetailsScreen(book)),
    );
  }
}
