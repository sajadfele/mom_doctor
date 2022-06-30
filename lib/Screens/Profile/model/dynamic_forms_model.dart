class DynamicFormsModel {
  String? _id;
  String? _created;
  String? _updated;
  String? _name;
  String? _content;

  DynamicFormsModel(
      {String? id,
        String? created,
        String? updated,
        String? name,
        String? content}) {
    if (id != null) {
      this._id = id;
    }
    if (created != null) {
      this._created = created;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (name != null) {
      this._name = name;
    }
    if (content != null) {
      this._content = content;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get content => _content;
  set content(String? content) => _content = content;

  DynamicFormsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _name = json['name'];
    _content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    data['name'] = this._name;
    data['content'] = this._content;
    return data;
  }
}
