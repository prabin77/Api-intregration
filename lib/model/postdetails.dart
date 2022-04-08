class PostDetails {
  PostDetails(
      {required this.id,
      required this.userid,
      required this.title,
      required this.body});

  final int id;
  final int userid;
  final String title;
  final String body;

  factory PostDetails.fromJson(Map<String, dynamic> json) {
    return PostDetails(
        id: json["id"],
        userid: json["userId"],
        title: json["title"],
        body: json["body"]);
  }
}
