import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon/api/post.dart';
import 'package:http/http.dart' as http;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  Future<List<Book>> fetchFirst20Books() async {
    final uri = Uri.parse('https://openlibrary.org/subjects/textbooks_history.json?limit=20');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> works = data['works'];

      List<Book> books = [];
      for (var work in works) {
        final book = Book.fromJson(work);
        final authorKey = work['authors'] != null && work['authors'].isNotEmpty
            ? work['authors'][0]['key']
            : null;

        if (authorKey != null) {
          final authorName = await fetchAuthorName(authorKey);
          book.author = authorName;
        }

        books.add(book);
      }

      return books;
    } else {
      throw Exception('Failed to load the first 20 books');
    }
  }

  Future<String> fetchAuthorName(String authorKey) async {
    final authorUri = Uri.parse('https://openlibrary.org$authorKey.json');
    final authorResponse = await http.get(authorUri);

    if (authorResponse.statusCode == 200) {
      final Map<String, dynamic> authorData = json.decode(authorResponse.body);
      return authorData['name'] ?? 'Unknown';
    } else {
      return 'Unknown';
    }
  }

  // Future<Post?>? post;

  // void getPosts() {
  //   setState(() {
  //     post = fetchPost();
  //   });
  // }

  // void createPosts() {
  //   setState(() {
  //     post = fetchPost();
  //     createPost('title', 'body');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<Book>>(
          future: fetchFirst20Books(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No books available'));
            } else {
              final books = snapshot.data;

              return ListView.builder(
                itemCount: books!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        books[index].thumbnailUrl,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    title: Text(books[index].title),
                    subtitle: Text('Author: ${books[index].author}'),
                  );
                },
              );
            }
          },
        ));
  }

  Widget buildDataWidget(context, snapshot) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(snapshot.data.title),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(snapshot.data.description),
          ),
        ],
      );
}
