class MedicalFieldsModel {
  List<MedicalFieldModel>? _content;
  Pageable? _pageable;
  bool? _last;
  int? _totalPages;
  int? _totalElements;
  Sort? _sort;
  bool? _first;
  int? _numberOfElements;
  int? _size;
  int? _number;
  bool? _empty;

  MedicalFieldsModel(
      {List<MedicalFieldModel>? content,
        Pageable? pageable,
        bool? last,
        int? totalPages,
        int? totalElements,
        Sort? sort,
        bool? first,
        int? numberOfElements,
        int? size,
        int? number,
        bool? empty}) {
    if (content != null) {
      this._content = content;
    }
    if (pageable != null) {
      this._pageable = pageable;
    }
    if (last != null) {
      this._last = last;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalElements != null) {
      this._totalElements = totalElements;
    }
    if (sort != null) {
      this._sort = sort;
    }
    if (first != null) {
      this._first = first;
    }
    if (numberOfElements != null) {
      this._numberOfElements = numberOfElements;
    }
    if (size != null) {
      this._size = size;
    }
    if (number != null) {
      this._number = number;
    }
    if (empty != null) {
      this._empty = empty;
    }
  }

  List<MedicalFieldModel>? get content => _content;
  set content(List<MedicalFieldModel>? content) => _content = content;
  Pageable? get pageable => _pageable;
  set pageable(Pageable? pageable) => _pageable = pageable;
  bool? get last => _last;
  set last(bool? last) => _last = last;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalElements => _totalElements;
  set totalElements(int? totalElements) => _totalElements = totalElements;
  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  bool? get first => _first;
  set first(bool? first) => _first = first;
  int? get numberOfElements => _numberOfElements;
  set numberOfElements(int? numberOfElements) =>
      _numberOfElements = numberOfElements;
  int? get size => _size;
  set size(int? size) => _size = size;
  int? get number => _number;
  set number(int? number) => _number = number;
  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;

  MedicalFieldsModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      _content = <MedicalFieldModel>[];
      json['content'].forEach((v) {
        _content!.add(new MedicalFieldModel.fromJson(v));
      });
    }
    _pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    _last = json['last'];
    _totalPages = json['totalPages'];
    _totalElements = json['totalElements'];
    _sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    _first = json['first'];
    _numberOfElements = json['numberOfElements'];
    _size = json['size'];
    _number = json['number'];
    _empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._content != null) {
      data['content'] = this._content!.map((v) => v.toJson()).toList();
    }
    if (this._pageable != null) {
      data['pageable'] = this._pageable!.toJson();
    }
    data['last'] = this._last;
    data['totalPages'] = this._totalPages;
    data['totalElements'] = this._totalElements;
    if (this._sort != null) {
      data['sort'] = this._sort!.toJson();
    }
    data['first'] = this._first;
    data['numberOfElements'] = this._numberOfElements;
    data['size'] = this._size;
    data['number'] = this._number;
    data['empty'] = this._empty;
    return data;
  }
}

class MedicalFieldModel {
  String? _id;
  String? _created;
  String? _updated;
  String? _name;

  MedicalFieldModel({String? id, String? created, String? updated, String? name}) {
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
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  String? get name => _name;
  set name(String? name) => _name = name;

  MedicalFieldModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    data['name'] = this._name;
    return data;
  }
}

class Pageable {
  Sort? _sort;
  int? _pageNumber;
  int? _pageSize;
  int? _offset;
  bool? _paged;
  bool? _unpaged;

  Pageable(
      {Sort? sort,
        int? pageNumber,
        int? pageSize,
        int? offset,
        bool? paged,
        bool? unpaged}) {
    if (sort != null) {
      this._sort = sort;
    }
    if (pageNumber != null) {
      this._pageNumber = pageNumber;
    }
    if (pageSize != null) {
      this._pageSize = pageSize;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (paged != null) {
      this._paged = paged;
    }
    if (unpaged != null) {
      this._unpaged = unpaged;
    }
  }

  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  int? get pageNumber => _pageNumber;
  set pageNumber(int? pageNumber) => _pageNumber = pageNumber;
  int? get pageSize => _pageSize;
  set pageSize(int? pageSize) => _pageSize = pageSize;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  bool? get paged => _paged;
  set paged(bool? paged) => _paged = paged;
  bool? get unpaged => _unpaged;
  set unpaged(bool? unpaged) => _unpaged = unpaged;

  Pageable.fromJson(Map<String, dynamic> json) {
    _sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    _pageNumber = json['pageNumber'];
    _pageSize = json['pageSize'];
    _offset = json['offset'];
    _paged = json['paged'];
    _unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._sort != null) {
      data['sort'] = this._sort!.toJson();
    }
    data['pageNumber'] = this._pageNumber;
    data['pageSize'] = this._pageSize;
    data['offset'] = this._offset;
    data['paged'] = this._paged;
    data['unpaged'] = this._unpaged;
    return data;
  }
}

class Sort {
  bool? _sorted;
  bool? _unsorted;
  bool? _empty;

  Sort({bool? sorted, bool? unsorted, bool? empty}) {
    if (sorted != null) {
      this._sorted = sorted;
    }
    if (unsorted != null) {
      this._unsorted = unsorted;
    }
    if (empty != null) {
      this._empty = empty;
    }
  }

  bool? get sorted => _sorted;
  set sorted(bool? sorted) => _sorted = sorted;
  bool? get unsorted => _unsorted;
  set unsorted(bool? unsorted) => _unsorted = unsorted;
  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;

  Sort.fromJson(Map<String, dynamic> json) {
    _sorted = json['sorted'];
    _unsorted = json['unsorted'];
    _empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this._sorted;
    data['unsorted'] = this._unsorted;
    data['empty'] = this._empty;
    return data;
  }
}
