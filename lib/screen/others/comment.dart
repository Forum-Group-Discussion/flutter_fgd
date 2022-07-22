// ignore_for_file: sort_child_properties_last, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key? key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 19, 21, 1),
      body: ListView(
        children: [
          Container(
            child: CommentTreeWidget<Comment, Comment>(
              Comment(
                  avatar: 'null',
                  userName: 'null',
                  content: 'Saya sangat setuju dengan pendapat anda!!!'),
              [
                Comment(
                    avatar: 'null',
                    userName: 'null',
                    content: 'Saya juga setuju, keren sekali'),
                Comment(
                    avatar: 'null',
                    userName: 'null',
                    content:
                        'Mantaaaaaaaaaaaaaaaaaaaappppppppppppppppppp!!!!!!!!!!!!!!!!!!!!!!'),
              ],
              avatarRoot: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/846370/screenshots/15125758/media/023ecbffbd17bef88d143c8198acf89e.jpg?compress=1&resize=400x300'),
                ),
                preferredSize: Size.fromRadius(18),
              ),
              avatarChild: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/846370/screenshots/15125758/media/023ecbffbd17bef88d143c8198acf89e.jpg?compress=1&resize=400x300'),
                ),
                preferredSize: Size.fromRadius(12),
              ),
              contentChild: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 28, 34, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Marvelista Clarifikasi',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${data.content}',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Like'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Reply'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Report'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              contentRoot: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 28, 34, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mas Febrianto',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${data.content}',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Like'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Reply'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Report'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          Container(
            child: CommentTreeWidget<Comment, Comment>(
              Comment(
                  avatar: 'null',
                  userName: 'null',
                  content: 'Keren sekali opininya'),
              [
                Comment(avatar: 'null', userName: 'null', content: 'Yoi gann'),
              ],
              avatarRoot: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/846370/screenshots/15125758/media/023ecbffbd17bef88d143c8198acf89e.jpg?compress=1&resize=400x300'),
                ),
                preferredSize: Size.fromRadius(18),
              ),
              avatarChild: (context, data) => PreferredSize(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/846370/screenshots/15125758/media/023ecbffbd17bef88d143c8198acf89e.jpg?compress=1&resize=400x300'),
                ),
                preferredSize: Size.fromRadius(12),
              ),
              contentChild: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 28, 34, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bang Gladys',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${data.content}',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Like'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Reply'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Report'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              contentRoot: (context, data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 28, 34, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ihsan Ganteng',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${data.content}',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Like'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Reply'),
                            SizedBox(
                              width: 24,
                            ),
                            Text('Report'),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ],
      ),
    );
  }
}
