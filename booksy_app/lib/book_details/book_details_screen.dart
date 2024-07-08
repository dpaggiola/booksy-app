import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book _book;
  const BookDetailsScreen(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle libro"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverWidget(_book.coverURL),
            BookInfoWidget(_book.title, _book.author, _book.description),
            ElevatedButton(onPressed: () {}, child: const Text("Botón")),
          ],
        ),
      ),
    );
  }
}

class BookInfoWidget extends StatelessWidget {
  final String _title;
  final String _author;
  final String _description;
  const BookInfoWidget(this._title, this._author, this._description,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            _author,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Text(
            _description,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  final String _coverURL;
  const BookCoverWidget(this._coverURL, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: 230,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 20,
        ),
      ]),
      child: Image.asset(_coverURL),
    );
  }
}
