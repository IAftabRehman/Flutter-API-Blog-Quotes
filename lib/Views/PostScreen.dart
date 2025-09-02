import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Elements/CustomTextWidget.dart';
import '../Elements/CustomContainerWidget.dart';
import '../Provider/PostProvider.dart';
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
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: MyText(
                                text: post.title,
                                color: Colors.white,
                                size: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            MyContainer(
                              child: MyText(
                                text: post.body,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                customIconWithRow(
                                  post.likes.toString(),
                                  Icons.thumb_up,
                                ),
                                customIconWithRow(
                                  post.dislikes.toString(),
                                  Icons.thumb_down,
                                ),
                                const Spacer(),
                                MyText(
                                  text: "👀 ${post.views}", color: Colors.white
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            MyContainer(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                        text: "Comment",
                                        size: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      // MyText(text: post.id.toString(), size: 18, color: Colors.white, fontWeight: FontWeight.w600)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            MyIconContainer(
                              icon: Icons.keyboard_arrow_down,
                              iconSize: 30,
                              iconColor: Colors.white,
                            ),
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

    //   itemBuilder: (context, index) {
    //     final post = provider.posts[index];
    //     return Card(
    //       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    //       child: Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(post.title,
    //                 style: const TextStyle(
    //                     fontSize: 18, fontWeight: FontWeight.bold)),
    //             const SizedBox(height: 5),
    //             Text(post.body),
    //             const SizedBox(height: 10),
    //             Wrap(
    //               spacing: 6,
    //               children: post.tags
    //                   .map((tag) => Chip(label: Text(tag)))
    //                   .toList(),
    //             ),
    //             const SizedBox(height: 10),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 // Text("👍 ${post.reactions} Likes"),
    //                 Text("👀 ${post.views} Views"),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // ),
    // );
  }

  Padding customIconWithRow(String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          MyIconContainer(icon: icon, iconColor: Colors.white, iconSize: 22),
          const SizedBox(width: 3),
          MyText(text: value, color: Colors.white, size: 16),
        ],
      ),
    );
  }
}
