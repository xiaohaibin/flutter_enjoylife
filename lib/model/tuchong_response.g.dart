// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuchong_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TuchongRespon _$TuchongResponFromJson(Map<String, dynamic> json) {
  return new TuchongRespon(
      json['is_history'] as bool,
      json['counts'] as int,
      (json['feedList'] as List)
          ?.map((e) => e == null
              ? null
              : new FeedList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['message'] as String,
      json['more'] as bool,
      json['result'] as String);
}

abstract class _$TuchongResponSerializerMixin {
  bool get isHistory;
  int get counts;
  List<FeedList> get feedList;
  String get message;
  bool get more;
  String get result;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_history': isHistory,
        'counts': counts,
        'feedList': feedList,
        'message': message,
        'more': more,
        'result': result
      };
}

FeedList _$FeedListFromJson(Map<String, dynamic> json) {
  return new FeedList(
      json['post_id'] as int,
      json['type'] as String,
      json['url'] as String,
      json['site_id'] as String,
      json['author_id'] as String,
      json['published_at'] as String,
      json['passed_time'] as String,
      json['excerpt'] as String,
      json['favorites'] as int,
      json['comments'] as int,
      json['rewardable'] as bool,
      json['parent_comments'] as String,
      json['rewards'] as String,
      json['views'] as int,
      json['collected'] as bool,
      json['shares'] as int,
      json['delete'] as bool,
      json['update'] as bool,
      json['content'] as String,
      json['title'] as String,
      json['image_count'] as int,
      (json['images'] as List)
          ?.map((e) =>
              e == null ? null : new Images.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      (json['event_tags'] as List)?.map((e) => e as String)?.toList(),
      json['favorite_list_prefix'] as List,
      json['reward_list_prefix'] as List,
      json['comment_list_prefix'] as List,
      json['data_type'] as String,
      json['created_at'] as String,
      json['sites'] as List,
      json['site'] == null
          ? null
          : new Site.fromJson(json['site'] as Map<String, dynamic>),
      json['recom_type'] as String,
      json['rqt_id'] as String,
      json['is_favorite'] as bool);
}

abstract class _$FeedListSerializerMixin {
  int get postId;
  String get type;
  String get url;
  String get siteId;
  String get authorId;
  String get publishedAt;
  String get passedTime;
  String get excerpt;
  int get favorites;
  int get comments;
  bool get rewardable;
  String get parentComments;
  String get rewards;
  int get views;
  bool get collected;
  int get shares;
  bool get delete;
  bool get update;
  String get content;
  String get title;
  int get imageCount;
  List<Images> get images;
  List<String> get tags;
  List<String> get eventTags;
  List<dynamic> get favoriteListPrefix;
  List<dynamic> get rewardListPrefix;
  List<dynamic> get commentListPrefix;
  String get dataType;
  String get createdAt;
  List<dynamic> get sites;
  Site get site;
  String get recomType;
  String get rqtId;
  bool get isFavorite;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'post_id': postId,
        'type': type,
        'url': url,
        'site_id': siteId,
        'author_id': authorId,
        'published_at': publishedAt,
        'passed_time': passedTime,
        'excerpt': excerpt,
        'favorites': favorites,
        'comments': comments,
        'rewardable': rewardable,
        'parent_comments': parentComments,
        'rewards': rewards,
        'views': views,
        'collected': collected,
        'shares': shares,
        'delete': delete,
        'update': update,
        'content': content,
        'title': title,
        'image_count': imageCount,
        'images': images,
        'tags': tags,
        'event_tags': eventTags,
        'favorite_list_prefix': favoriteListPrefix,
        'reward_list_prefix': rewardListPrefix,
        'comment_list_prefix': commentListPrefix,
        'data_type': dataType,
        'created_at': createdAt,
        'sites': sites,
        'site': site,
        'recom_type': recomType,
        'rqt_id': rqtId,
        'is_favorite': isFavorite
      };
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return new Images(
      json['img_id'] as int,
      json['user_id'] as int,
      json['title'] as String,
      json['excerpt'] as String,
      json['width'] as int,
      json['height'] as int,
      json['description'] as String);
}

abstract class _$ImagesSerializerMixin {
  int get imgId;
  int get userId;
  String get title;
  String get excerpt;
  int get width;
  int get height;
  String get description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'img_id': imgId,
        'user_id': userId,
        'title': title,
        'excerpt': excerpt,
        'width': width,
        'height': height,
        'description': description
      };
}

Site _$SiteFromJson(Map<String, dynamic> json) {
  return new Site(
      json['site_id'] as String,
      json['type'] as String,
      json['name'] as String,
      json['domain'] as String,
      json['description'] as String,
      json['followers'] as int,
      json['url'] as String,
      json['icon'] as String,
      json['verified'] as bool,
      json['verified_type'] as int,
      json['verified_reason'] as String,
      json['verifications'] as int,
      json['verification_list'] as List,
      json['is_following'] as bool);
}

abstract class _$SiteSerializerMixin {
  String get siteId;
  String get type;
  String get name;
  String get domain;
  String get description;
  int get followers;
  String get url;
  String get icon;
  bool get verified;
  int get verifiedType;
  String get verifiedReason;
  int get verifications;
  List<dynamic> get verificationList;
  bool get isFollowing;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'site_id': siteId,
        'type': type,
        'name': name,
        'domain': domain,
        'description': description,
        'followers': followers,
        'url': url,
        'icon': icon,
        'verified': verified,
        'verified_type': verifiedType,
        'verified_reason': verifiedReason,
        'verifications': verifications,
        'verification_list': verificationList,
        'is_following': isFollowing
      };
}
