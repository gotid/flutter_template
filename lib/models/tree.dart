import 'dart:convert';

class Tree {
  int id;
  int parentChapterId;
  int courseId;
  int order;
  int visible;
  String name;
  bool userControlSetTop;
  List<Tree> children;

  
  Tree({
    this.id,
    this.parentChapterId,
    this.courseId,
    this.order,
    this.visible,
    this.name,
    this.userControlSetTop,
    this.children,
  });

  Tree copyWith({
    int id,
    int parentChapterId,
    int courseId,
    int order,
    int visible,
    String name,
    bool userControlSetTop,
    List<Tree> children,
  }) {
    return Tree(
      id: id ?? this.id,
      parentChapterId: parentChapterId ?? this.parentChapterId,
      courseId: courseId ?? this.courseId,
      order: order ?? this.order,
      visible: visible ?? this.visible,
      name: name ?? this.name,
      userControlSetTop: userControlSetTop ?? this.userControlSetTop,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentChapterId': parentChapterId,
      'courseId': courseId,
      'order': order,
      'visible': visible,
      'name': name,
      'userControlSetTop': userControlSetTop,
      'children': List<Tree>.from(children.map((x) => x.toMap())),
    };
  }

  static Tree fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Tree(
      id: map['id'],
      parentChapterId: map['parentChapterId'],
      courseId: map['courseId'],
      order: map['order'],
      visible: map['visible'],
      name: map['name'],
      userControlSetTop: map['userControlSetTop'],
      children: List<Tree>.from(map['children']?.map((x) => Tree.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Tree fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tree id: $id, parentChapterId: $parentChapterId, courseId: $courseId, order: $order, visible: $visible, name: $name, userControlSetTop: $userControlSetTop, children: $children';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Tree &&
      o.id == id &&
      o.parentChapterId == parentChapterId &&
      o.courseId == courseId &&
      o.order == order &&
      o.visible == visible &&
      o.name == name &&
      o.userControlSetTop == userControlSetTop &&
      o.children == children;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      parentChapterId.hashCode ^
      courseId.hashCode ^
      order.hashCode ^
      visible.hashCode ^
      name.hashCode ^
      userControlSetTop.hashCode ^
      children.hashCode;
  }
}