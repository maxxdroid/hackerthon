class Post {
  final String userId; // Change to String
  final String id;     // Change to String
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'].toString(), // Ensure it's converted to String
      id: json['id'].toString(),         // Ensure it's converted to String
      title: json['title'],
      body: json['body'],
    );
  }
}

class Author {
  final String name;

  Author({required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
    );
  }
}


class Book {
  final String title;
  String author;
  String thumbnailUrl; // URL of the book cover image

  Book({required this.title, required this.author, required this.thumbnailUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    print('...................................${json["entries"]}');
    return Book(
      title: json['title'],
      author: 'Unknown', // Initialize with 'Unknown'
      thumbnailUrl: json['cover_img'] != null
          ? 'https://covers.openlibrary.org/b/isbn/${json['value']}-M.jpg'
          : 'https://covers.openlibrary.org/a/olid/OL229501A-S.jpg', // Generate thumbnail URL from cover_i
    );
  }
}