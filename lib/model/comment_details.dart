class CommentDetails {
  CommentDetails(
      {required this.id,
      required this.email,
      required this.postid,
      required this.body,
      required this.name});

  final int id;
  final int postid;
  final String name;
  final String body;
  final String email;

  factory CommentDetails.fromJson(Map<String, dynamic> json) {
    return CommentDetails(
        id: json["id"],
        email: json["email"],
        postid: json["postId"],
        body: json["body"],
        name: json["name"]);
  }
}
