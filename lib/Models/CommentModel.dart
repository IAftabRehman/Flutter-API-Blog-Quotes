class CommentModel {
  final int id;
  final String body;
  final int postId;
  final String user;

  CommentModel({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      user: json['user']['username'],
    );
  }
}
