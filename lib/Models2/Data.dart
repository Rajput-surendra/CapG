class Data {
  Data({
      this.id, 
      this.name, 
      this.parentId, 
      this.slug, 
      this.image, 
      this.banner, 
      this.rowOrder, 
      this.status, 
      this.clicks,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    slug = json['slug'];
    image = json['image'];
    banner = json['banner'];
    rowOrder = json['row_order'];
    status = json['status'];
    clicks = json['clicks'];
  }
  String id;
  String name;
  String parentId;
  String slug;
  String image;
  String banner;
  String rowOrder;
  String status;
  String clicks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parent_id'] = parentId;
    map['slug'] = slug;
    map['image'] = image;
    map['banner'] = banner;
    map['row_order'] = rowOrder;
    map['status'] = status;
    map['clicks'] = clicks;
    return map;
  }

}