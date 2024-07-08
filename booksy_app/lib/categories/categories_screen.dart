import 'package:booksy_app/model/book_category.dart';
import 'package:booksy_app/utils.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookCategoriesGrid();
  }
}

class BookCategoriesGrid extends StatelessWidget {
  BookCategoriesGrid({super.key});

  final List<BookCategory> _categories = [
    const BookCategory(1, "Ciencia Ficción", "#A9CCE3"),
    const BookCategory(2, "Aventura", "#C5F0B3"),
    const BookCategory(3, "Filosofía", "#F0B3E1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TileCategory(_categories[index]);
        },
      ),
    );
  }
}

class TileCategory extends StatelessWidget {
  final BookCategory _category;
  const TileCategory(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _navegateToBooksWithCategory();
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: hexToColor(_category.colorBg),
            ),
            child: Text(
              _category.name,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
                ),
          ),
        ));
  }

  void _navegateToBooksWithCategory() {
    // TODO navegar a pantalla de lista de libros de la categoria
  }
}
