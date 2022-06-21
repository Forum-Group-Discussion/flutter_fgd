// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controller = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(15, 19, 21, 1),
        body: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Book Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.pink))),
              onChanged: searchBook,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: ((context, index) {
                  final book = books[index];
                  return ListTile(
                    leading: Image.network(
                      book.urlimage,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      book.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
}

class Book {
  final String title;
  final String urlimage;

  Book({required this.title, required this.urlimage});
}

List<Book> allBooks = [
  Book(
      title: 'One Piece',
      urlimage:
          'https://www.greenscene.co.id/wp-content/uploads/2022/05/One-Piece-6-696x497.jpg'),
  Book(
      title: 'Naruto',
      urlimage:
          'https://www.greenscene.co.id/wp-content/uploads/2022/05/One-Piece-6-696x497.jpg'),
  Book(
      title: 'Bleach',
      urlimage:
          'https://www.greenscene.co.id/wp-content/uploads/2022/05/One-Piece-6-696x497.jpg'),
  Book(
      title: 'Koi Wa Sekai',
      urlimage:
          'https://www.greenscene.co.id/wp-content/uploads/2022/05/One-Piece-6-696x497.jpg'),
  Book(
      title: 'Jojo Bizarre Adventure',
      urlimage:
          'https://www.greenscene.co.id/wp-content/uploads/2022/05/One-Piece-6-696x497.jpg'),
];
