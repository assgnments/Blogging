import 'package:equatable/equatable.dart';
import 'package:simple_blog/simple_blog.dart';

class Post extends Equatable implements Model {
  final String id;
  final String image;
  final String caption;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final bool isLiked;
  final User user;

  Post({
    this.id,
    this.image,
    this.caption,
    this.createdAt,
    this.likes,
    this.comments,
    this.isLiked,
    this.user,
  });

  Post copyWith({
    String id,
    String image,
    String caption,
    String profileImage,
    DateTime createdAt,
    int likes,
    int comments,
    bool isLiked,
    User user,
  }) {
    return Post(
      id: id ?? this.id,
      image: image ?? this.image,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      isLiked: isLiked ?? this.isLiked,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        id,
        image,
        caption,
        createdAt,
        likes,
        comments,
        isLiked,
        user,
      ];
}

extension ToggleLikeStatus on Post {
  Post _like() => copyWith(likes: likes + 1, isLiked: true);
  Post _unlike() => copyWith(likes: likes > 0 ? likes - 1 : 0, isLiked: false);
  Post toggleLike() {
    if (isLiked) {
      return _unlike();
    }
    return _like();
  }
}

extension CommentCountUpdate on Post {
  Post incrementComment() => copyWith(comments: comments + 1);
  Post decrementComment() =>
      copyWith(comments: comments > 0 ? comments - 1 : 0);
}
