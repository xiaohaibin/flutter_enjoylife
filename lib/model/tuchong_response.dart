import 'package:json_annotation/json_annotation.dart';

part 'tuchong_response.g.dart';

@JsonSerializable()
class TuchongRespon extends Object with _$TuchongResponSerializerMixin {
  @JsonKey(name: 'is_history')
  bool isHistory;

  @JsonKey(name: 'counts')
  int counts;

  @JsonKey(name: 'feedList')
  List<FeedList> feedList;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'more')
  bool more;

  @JsonKey(name: 'result')
  String result;

  TuchongRespon(
    this.isHistory,
    this.counts,
    this.feedList,
    this.message,
    this.more,
    this.result,
  );

  factory TuchongRespon.fromJson(Map<String, dynamic> srcJson) =>
      _$TuchongResponFromJson(srcJson);
}

@JsonSerializable()
class FeedList extends Object with _$FeedListSerializerMixin {
  @JsonKey(name: 'post_id')
  int postId;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'site_id')
  String siteId;

  @JsonKey(name: 'author_id')
  String authorId;

  @JsonKey(name: 'published_at')
  String publishedAt;

  @JsonKey(name: 'passed_time')
  String passedTime;

  @JsonKey(name: 'excerpt')
  String excerpt;

  @JsonKey(name: 'favorites')
  int favorites;

  @JsonKey(name: 'comments')
  int comments;

  @JsonKey(name: 'rewardable')
  bool rewardable;

  @JsonKey(name: 'parent_comments')
  String parentComments;

  @JsonKey(name: 'rewards')
  String rewards;

  @JsonKey(name: 'views')
  int views;

  @JsonKey(name: 'collected')
  bool collected;

  @JsonKey(name: 'shares')
  int shares;

  @JsonKey(name: 'delete')
  bool delete;

  @JsonKey(name: 'update')
  bool update;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'image_count')
  int imageCount;

  @JsonKey(name: 'images')
  List<Images> images;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'event_tags')
  List<String> eventTags;

  @JsonKey(name: 'favorite_list_prefix')
  List<dynamic> favoriteListPrefix;

  @JsonKey(name: 'reward_list_prefix')
  List<dynamic> rewardListPrefix;

  @JsonKey(name: 'comment_list_prefix')
  List<dynamic> commentListPrefix;

  @JsonKey(name: 'data_type')
  String dataType;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'sites')
  List<dynamic> sites;

  @JsonKey(name: 'site')
  Site site;

  @JsonKey(name: 'recom_type')
  String recomType;

  @JsonKey(name: 'rqt_id')
  String rqtId;

  @JsonKey(name: 'is_favorite')
  bool isFavorite;

  FeedList(
    this.postId,
    this.type,
    this.url,
    this.siteId,
    this.authorId,
    this.publishedAt,
    this.passedTime,
    this.excerpt,
    this.favorites,
    this.comments,
    this.rewardable,
    this.parentComments,
    this.rewards,
    this.views,
    this.collected,
    this.shares,
    this.delete,
    this.update,
    this.content,
    this.title,
    this.imageCount,
    this.images,
    this.tags,
    this.eventTags,
    this.favoriteListPrefix,
    this.rewardListPrefix,
    this.commentListPrefix,
    this.dataType,
    this.createdAt,
    this.sites,
    this.site,
    this.recomType,
    this.rqtId,
    this.isFavorite,
  );

  factory FeedList.fromJson(Map<String, dynamic> srcJson) =>
      _$FeedListFromJson(srcJson);
}

@JsonSerializable()
class Images extends Object with _$ImagesSerializerMixin {
  @JsonKey(name: 'img_id')
  int imgId;

  @JsonKey(name: 'user_id')
  int userId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'excerpt')
  String excerpt;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'description')
  String description;

  Images(
    this.imgId,
    this.userId,
    this.title,
    this.excerpt,
    this.width,
    this.height,
    this.description,
  );

  factory Images.fromJson(Map<String, dynamic> srcJson) =>
      _$ImagesFromJson(srcJson);
}

@JsonSerializable()
class Site extends Object with _$SiteSerializerMixin {
  @JsonKey(name: 'site_id')
  String siteId;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'domain')
  String domain;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'followers')
  int followers;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'verified')
  bool verified;

  @JsonKey(name: 'verified_type')
  int verifiedType;

  @JsonKey(name: 'verified_reason')
  String verifiedReason;

  @JsonKey(name: 'verifications')
  int verifications;

  @JsonKey(name: 'verification_list')
  List<dynamic> verificationList;

  @JsonKey(name: 'is_following')
  bool isFollowing;

  Site(
    this.siteId,
    this.type,
    this.name,
    this.domain,
    this.description,
    this.followers,
    this.url,
    this.icon,
    this.verified,
    this.verifiedType,
    this.verifiedReason,
    this.verifications,
    this.verificationList,
    this.isFollowing,
  );

  factory Site.fromJson(Map<String, dynamic> srcJson) =>
      _$SiteFromJson(srcJson);
}
