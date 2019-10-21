import 'dart:convert';

class Tag {
  String name;
  String url;
  Tag({
    this.name,
    this.url,
  });

  Tag copyWith({
    String name,
    String url,
  }) {
    return Tag(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  static Tag fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Tag(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  static Tag fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Tag name: $name, url: $url';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Tag && o.name == name && o.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Article {
  String apkLink;
  String author;
  String shareUser;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  int originId;
  String prefix;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<Tag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;
  Article({
    this.apkLink,
    this.author,
    this.shareUser,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.envelopePic,
    this.fresh,
    this.id,
    this.link,
    this.niceDate,
    this.origin,
    this.originId,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  Article copyWith({
    String apkLink,
    String author,
    String shareUser,
    int chapterId,
    String chapterName,
    bool collect,
    int courseId,
    String desc,
    String envelopePic,
    bool fresh,
    int id,
    String link,
    String niceDate,
    String origin,
    int originId,
    String prefix,
    String projectLink,
    int publishTime,
    int superChapterId,
    String superChapterName,
    List<Tag> tags,
    String title,
    int type,
    int userId,
    int visible,
    int zan,
  }) {
    return Article(
      apkLink: apkLink ?? this.apkLink,
      author: author ?? this.author,
      shareUser: shareUser ?? this.shareUser,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      collect: collect ?? this.collect,
      courseId: courseId ?? this.courseId,
      desc: desc ?? this.desc,
      envelopePic: envelopePic ?? this.envelopePic,
      fresh: fresh ?? this.fresh,
      id: id ?? this.id,
      link: link ?? this.link,
      niceDate: niceDate ?? this.niceDate,
      origin: origin ?? this.origin,
      originId: originId ?? this.originId,
      prefix: prefix ?? this.prefix,
      projectLink: projectLink ?? this.projectLink,
      publishTime: publishTime ?? this.publishTime,
      superChapterId: superChapterId ?? this.superChapterId,
      superChapterName: superChapterName ?? this.superChapterName,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      visible: visible ?? this.visible,
      zan: zan ?? this.zan,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'apkLink': apkLink,
      'author': author,
      'shareUser': shareUser,
      'chapterId': chapterId,
      'chapterName': chapterName,
      'collect': collect,
      'courseId': courseId,
      'desc': desc,
      'envelopePic': envelopePic,
      'fresh': fresh,
      'id': id,
      'link': link,
      'niceDate': niceDate,
      'origin': origin,
      'originId': originId,
      'prefix': prefix,
      'projectLink': projectLink,
      'publishTime': publishTime,
      'superChapterId': superChapterId,
      'superChapterName': superChapterName,
      'tags': List<dynamic>.from(tags.map((x) => x.toMap())),
      'title': title,
      'type': type,
      'userId': userId,
      'visible': visible,
      'zan': zan,
    };
  }

  static Article fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Article(
      apkLink: map['apkLink'],
      author: map['author'],
      shareUser: map['shareUser'],
      chapterId: map['chapterId'],
      chapterName: map['chapterName'],
      collect: map['collect'],
      courseId: map['courseId'],
      desc: map['desc'],
      envelopePic: map['envelopePic'],
      fresh: map['fresh'],
      id: map['id'],
      link: map['link'],
      niceDate: map['niceDate'],
      origin: map['origin'],
      originId: map['originId'],
      prefix: map['prefix'],
      projectLink: map['projectLink'],
      publishTime: map['publishTime'],
      superChapterId: map['superChapterId'],
      superChapterName: map['superChapterName'],
      tags: List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x))),
      title: map['title'],
      type: map['type'],
      userId: map['userId'],
      visible: map['visible'],
      zan: map['zan'],
    );
  }

  String toJson() => json.encode(toMap());

  static Article fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article apkLink: $apkLink, author: $author, shareUser: $shareUser, chapterId: $chapterId, chapterName: $chapterName, collect: $collect, courseId: $courseId, desc: $desc, envelopePic: $envelopePic, fresh: $fresh, id: $id, link: $link, niceDate: $niceDate, origin: $origin, originId: $originId, prefix: $prefix, projectLink: $projectLink, publishTime: $publishTime, superChapterId: $superChapterId, superChapterName: $superChapterName, tags: $tags, title: $title, type: $type, userId: $userId, visible: $visible, zan: $zan';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Article &&
      o.apkLink == apkLink &&
      o.author == author &&
      o.shareUser == shareUser &&
      o.chapterId == chapterId &&
      o.chapterName == chapterName &&
      o.collect == collect &&
      o.courseId == courseId &&
      o.desc == desc &&
      o.envelopePic == envelopePic &&
      o.fresh == fresh &&
      o.id == id &&
      o.link == link &&
      o.niceDate == niceDate &&
      o.origin == origin &&
      o.originId == originId &&
      o.prefix == prefix &&
      o.projectLink == projectLink &&
      o.publishTime == publishTime &&
      o.superChapterId == superChapterId &&
      o.superChapterName == superChapterName &&
      o.tags == tags &&
      o.title == title &&
      o.type == type &&
      o.userId == userId &&
      o.visible == visible &&
      o.zan == zan;
  }

  @override
  int get hashCode {
    return apkLink.hashCode ^
      author.hashCode ^
      shareUser.hashCode ^
      chapterId.hashCode ^
      chapterName.hashCode ^
      collect.hashCode ^
      courseId.hashCode ^
      desc.hashCode ^
      envelopePic.hashCode ^
      fresh.hashCode ^
      id.hashCode ^
      link.hashCode ^
      niceDate.hashCode ^
      origin.hashCode ^
      originId.hashCode ^
      prefix.hashCode ^
      projectLink.hashCode ^
      publishTime.hashCode ^
      superChapterId.hashCode ^
      superChapterName.hashCode ^
      tags.hashCode ^
      title.hashCode ^
      type.hashCode ^
      userId.hashCode ^
      visible.hashCode ^
      zan.hashCode;
  }
}