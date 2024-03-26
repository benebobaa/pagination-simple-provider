class Post {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class Contact {
  const Contact(
      {required this.id,
      required this.name,
      required this.email,
      required this.image});

  final int id;
  final String name;
  final String email;
  final String image;

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      name: json['first_name'] as String,
      email: json['email'] as String,
      image: json['avatar'] as String,
    );
  }
}
