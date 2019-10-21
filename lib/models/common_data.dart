import 'dart:convert';

class CommonData {
  int id;
  String title;
  String description;
  String author;
  String bookImage;
  String content;
  num score;
  bool delete;
  DateTime createdAt;
  DateTime updatedAt;
  num view;
  bool recommend;
  CommonData({
    this.id,
    this.title,
    this.description,
    this.author,
    this.bookImage,
    this.content,
    this.score,
    this.delete,
    this.createdAt,
    this.updatedAt,
    this.view,
    this.recommend,
  });

  CommonData copyWith({
    int id,
    String title,
    String description,
    String author,
    String bookImage,
    String content,
    num score,
    bool delete,
    DateTime createdAt,
    DateTime updatedAt,
    num view,
    bool recommend,
  }) {
    return CommonData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      bookImage: bookImage ?? this.bookImage,
      content: content ?? this.content,
      score: score ?? this.score,
      delete: delete ?? this.delete,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      view: view ?? this.view,
      recommend: recommend ?? this.recommend,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'bookImage': bookImage,
      'content': content,
      'score': score,
      'delete': delete,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'view': view,
      'recommend': recommend,
    };
  }

  static CommonData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CommonData(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      author: map['author'],
      bookImage: map['bookImage'],
      content: map['content'],
      score: map['score'],
      delete: map['delete'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      view: map['view'],
      recommend: map['recommend'],
    );
  }

  String toJson() => json.encode(toMap());

  static CommonData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommonData id: $id, title: $title, description: $description, author: $author, bookImage: $bookImage, content: $content, score: $score, delete: $delete, createdAt: $createdAt, updatedAt: $updatedAt, view: $view, recommend: $recommend';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CommonData &&
        o.id == id &&
        o.title == title &&
        o.description == description &&
        o.author == author &&
        o.bookImage == bookImage &&
        o.content == content &&
        o.score == score &&
        o.delete == delete &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.view == view &&
        o.recommend == recommend;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        author.hashCode ^
        bookImage.hashCode ^
        content.hashCode ^
        score.hashCode ^
        delete.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        view.hashCode ^
        recommend.hashCode;
  }
}
