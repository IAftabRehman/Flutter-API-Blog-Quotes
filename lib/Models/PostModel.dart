class PostModel {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final int views;
  final int likes;
  final int dislikes;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.views,
    required this.likes,
    required this.dislikes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      views: json['views'] ?? 0,
      likes: json['reactions']?['likes'] ?? 0,
      dislikes: json['reactions']?['dislikes'] ?? 0,
    );
  }
}
