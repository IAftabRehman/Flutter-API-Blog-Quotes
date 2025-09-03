import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Elements/CustomTextWidget.dart';
import '../Elements/CustomContainerWidget.dart';
import '../Models/PostModel.dart';
import '../Provider/PostProvider.dart';
import '../Services/PostServices.dart';
import '../Widgets/AppBarWidget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PostProvider>(context, listen: false).fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBarWidget(
                title: "Daily Stores",
                searchIcon: true,
                profileIcon: true,
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: provider.posts.length,
                  itemBuilder: (context, index) {
                    final post = provider.posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyContainer(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              text: post.title,
                              color: Colors.grey,
                              size: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                            const SizedBox(height: 8),
                            MyText(
                              text: post.body,
                              color: Colors.white54,
                              size: 16,

                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                customIconWithRow(post.likes.toString(), Icons.thumb_up),
                                customIconWithRow(post.dislikes.toString(), Icons.thumb_down),
                                const Spacer(),
                                MyText(text: "👀 ${post.views}", color: Colors.white70),
                              ],
                            ),
                            IconButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PostDetailsScreen(post: post),
                                ),
                              );
                            }, icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30,))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customIconWithRow(String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          MyIconContainer(icon: icon, iconColor: Colors.white, iconSize: 22),
          const SizedBox(width: 3),
          MyText(text: value, color: Colors.white, size: 16,),
        ],
      ),
    );
  }
}



class PostDetailsScreen extends StatelessWidget {
  final PostModel post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyContainer(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.keyboard_arrow_left, size: 30, color: Colors.white)),
              const SizedBox(height: 30),
              MyText(text: post.title, color: Colors.white, size: 19, fontWeight: FontWeight.bold),
              const SizedBox(height: 10),
              MyText(text: post.body, color: Colors.white,
                size: 16,
                fontWeight: FontWeight.bold,),
              const SizedBox(height: 10),
              Row(
                children: [
                  MyText(text: "👍 ${post.likes}", color: Colors.white,),
                  const SizedBox(width: 10),
                  MyText(text: "👎 ${post.dislikes}", color: Colors.white,),
                  const Spacer(),
                  MyText(text: "👀 ${post.views}", color: Colors.white,),
                ],
              ),
              const Divider(height: 30),
              MyText(text: "Comments", size: 18, color: Colors.white, fontWeight: FontWeight.w600),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder(
                  future: PostServices().getCommentsByPostId(post.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: MyText(text: "No comments found", color: Colors.white,));
                    }

                    final comments = snapshot.data!;
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return ListTile(
                          leading: const Icon(Icons.comment, color: Colors.white,),
                          title: MyText(text: comment.body, color: Colors.white,),
                          subtitle: MyText(text: "By: ${comment.user}", color: Colors.white54,),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
