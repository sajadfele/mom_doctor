import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/Screens/Profile/model/medical_fields_model.dart';

class MyQasModel {
  List<QaModel>? _content;
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

  MyQasModel(
      {List<QaModel>? content,
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

  List<QaModel>? get content => _content;
  set content(List<QaModel>? content) => _content = content;
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

  MyQasModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      _content = <QaModel>[];
      json['content'].forEach((v) {
        _content!.add(new QaModel.fromJson(v));
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

class QaModel {
  String? _id;
  String? _created;
  String? _updated;
  String? _code;
  String? _subject;
  String? _question;
  List<MedicalFieldModel>? _medicalFields;
  List<Topics>? _topics;
  User? _user;
  int? _totalLikes;
  bool? _isBookmarked;
  String? _status;
  AnswerModel? _firstAnswer;

  QaModel(
      {String? id,
        String? created,
        String? updated,
        String? code,
        String? subject,
        String? question,
        List<MedicalFieldModel>? medicalFields,
        List<Topics>? topics,
        User? user,
        int? totalLikes,
        bool? isBookmarked,
        String? status,
        AnswerModel? firstAnswer}) {
    if (id != null) {
      this._id = id;
    }
    if (created != null) {
      this._created = created;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (code != null) {
      this._code = code;
    }
    if (subject != null) {
      this._subject = subject;
    }
    if (question != null) {
      this._question = question;
    }
    if (medicalFields != null) {
      this._medicalFields = medicalFields;
    }
    if (topics != null) {
      this._topics = topics;
    }
    if (user != null) {
      this._user = user;
    }
    if (totalLikes != null) {
      this._totalLikes = totalLikes;
    }
    if (isBookmarked != null) {
      this._isBookmarked = isBookmarked;
    }
    if (status != null) {
      this._status = status;
    }
    if (firstAnswer != null) {
      this._firstAnswer = firstAnswer;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  String? get code => _code;
  set code(String? code) => _code = code;
  String? get subject => _subject;
  set subject(String? subject) => _subject = subject;
  String? get question => _question;
  set question(String? question) => _question = question;
  List<MedicalFieldModel>? get medicalFields => _medicalFields;
  set medicalFields(List<MedicalFieldModel>? medicalFields) =>
      _medicalFields = medicalFields;
  List<Topics>? get topics => _topics;
  set topics(List<Topics>? topics) => _topics = topics;
  User? get user => _user;
  set user(User? user) => _user = user;
  int? get totalLikes => _totalLikes;
  set totalLikes(int? totalLikes) => _totalLikes = totalLikes;
  bool? get isBookmarked => _isBookmarked;
  set isBookmarked(bool? isBookmarked) => _isBookmarked = isBookmarked;
  String? get status => _status;
  set status(String? status) => _status = status;
  AnswerModel? get firstAnswer => _firstAnswer;
  set firstAnswer(AnswerModel? firstAnswer) => _firstAnswer = firstAnswer;

  QaModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _code = json['code'];
    _subject = json['subject'];
    _question = json['question'];
    if (json['medicalFields'] != null) {
      _medicalFields = <MedicalFieldModel>[];
      json['medicalFields'].forEach((v) {
        _medicalFields!.add(new MedicalFieldModel.fromJson(v));
      });
    }
    if (json['topics'] != null) {
      _topics = <Topics>[];
      json['topics'].forEach((v) {
        _topics!.add(new Topics.fromJson(v));
      });
    }
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _totalLikes = json['totalLikes'];
    _isBookmarked = json['isBookmarked'];
    _status = json['status'];
    _firstAnswer = json['firstAnswer'] != null
        ? new AnswerModel.fromJson(json['firstAnswer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    data['code'] = this._code;
    data['subject'] = this._subject;
    data['question'] = this._question;
    if (this._medicalFields != null) {
      data['medicalFields'] =
          this._medicalFields!.map((v) => v.toJson()).toList();
    }
    if (this._topics != null) {
      data['topics'] = this._topics!.map((v) => v.toJson()).toList();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['totalLikes'] = this._totalLikes;
    data['isBookmarked'] = this._isBookmarked;
    data['status'] = this._status;
    if (this._firstAnswer != null) {
      data['firstAnswer'] = this._firstAnswer!.toJson();
    }
    return data;
  }
}

class Topics {
  String? _id;
  String? _created;
  String? _updated;
  String? _name;

  Topics({String? id, String? created, String? updated, String? name}) {
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

  Topics.fromJson(Map<String, dynamic> json) {
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

class User {
  String? _id;
  String? _created;
  String? _updated;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _address;
  String? _mobile;
  Null? _language;
  String? _profileImage;
  String? _sex;
  String? _status;
  String? _bdate;

  User(
      {String? id,
        String? created,
        String? updated,
        String? firstName,
        String? lastName,
        String? email,
        String? address,
        String? mobile,
        Null? language,
        String? profileImage,
        String? sex,
        String? status,
        String? bdate}) {
    if (id != null) {
      this._id = id;
    }
    if (created != null) {
      this._created = created;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (address != null) {
      this._address = address;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (language != null) {
      this._language = language;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
    if (sex != null) {
      this._sex = sex;
    }
    if (status != null) {
      this._status = status;
    }
    if (bdate != null) {
      this._bdate = bdate;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  Null? get language => _language;
  set language(Null? language) => _language = language;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  String? get sex => _sex;
  set sex(String? sex) => _sex = sex;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get bdate => _bdate;
  set bdate(String? bdate) => _bdate = bdate;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _address = json['address'];
    _mobile = json['mobile'];
    _language = json['language'];
    _profileImage = json['profileImage'];
    _sex = json['sex'];
    _status = json['status'];
    _bdate = json['bdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['address'] = this._address;
    data['mobile'] = this._mobile;
    data['language'] = this._language;
    data['profileImage'] = this._profileImage;
    data['sex'] = this._sex;
    data['status'] = this._status;
    data['bdate'] = this._bdate;
    return data;
  }
}

class AnswerModel {
  String? _id;
  String? _created;
  String? _updated;
  Doctor? _doctor;
  String? _answer;
  bool? _isUserLiked;
  int? _likeCount;
  int? _disLikeCount;

  AnswerModel(
      {String? id,
        String? created,
        String? updated,
        Doctor? doctor,
        String? answer,
        bool? isUserLiked,
        int? likeCount,
        int? disLikeCount}) {
    if (id != null) {
      this._id = id;
    }
    if (created != null) {
      this._created = created;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (doctor != null) {
      this._doctor = doctor;
    }
    if (answer != null) {
      this._answer = answer;
    }
    if (isUserLiked != null) {
      this._isUserLiked = isUserLiked;
    }
    if (likeCount != null) {
      this._likeCount = likeCount;
    }
    if (disLikeCount != null) {
      this._disLikeCount = disLikeCount;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  Doctor? get doctor => _doctor;
  set doctor(Doctor? doctor) => _doctor = doctor;
  String? get answer => _answer;
  set answer(String? answer) => _answer = answer;
  bool? get isUserLiked => _isUserLiked;
  set isUserLiked(bool? isUserLiked) => _isUserLiked = isUserLiked;
  int? get likeCount => _likeCount;
  set likeCount(int? likeCount) => _likeCount = likeCount;
  int? get disLikeCount => _disLikeCount;
  set disLikeCount(int? disLikeCount) => _disLikeCount = disLikeCount;

  AnswerModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    _answer = json['answer'];
    _isUserLiked = json['isUserLiked'];
    _likeCount = json['likeCount'];
    _disLikeCount = json['disLikeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    if (this._doctor != null) {
      data['doctor'] = this._doctor!.toJson();
    }
    data['answer'] = this._answer;
    data['isUserLiked'] = this._isUserLiked;
    data['likeCount'] = this._likeCount;
    data['disLikeCount'] = this._disLikeCount;
    return data;
  }
}

class Doctor {
  String? _id;
  String? _created;
  String? _updated;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _address;
  String? _mobile;
  Null? _language;
  String? _profileImage;
  double? _rate;
  int? _commentCount;
  String? _shebaNumber;
  String? _bio;
  String? _description;
  bool? _canOnlineReserve;
  bool? _canOfflineReserve;
  int? _onlinePrice;
  String? _onlinePriceFormatted;
  int? _offlinePrice;
  String? _offlinePriceFormatted;
  String? _officeNumber;
  List<InsurModel>? _insurList;
  List<MedicalFieldModel>? _medicalFields;
  String? _status;
  String? _bdate;

  Doctor(
      {String? id,
        String? created,
        String? updated,
        String? firstName,
        String? lastName,
        String? email,
        String? address,
        String? mobile,
        Null? language,
        String? profileImage,
        double? rate,
        int? commentCount,
        String? shebaNumber,
        String? bio,
        String? description,
        bool? canOnlineReserve,
        bool? canOfflineReserve,
        int? onlinePrice,
        String? onlinePriceFormatted,
        int? offlinePrice,
        String? offlinePriceFormatted,
        String? officeNumber,
        List<InsurModel>? insurList,
        List<MedicalFieldModel>? medicalFields,
        String? status,
        String? bdate}) {
    if (id != null) {
      this._id = id;
    }
    if (created != null) {
      this._created = created;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (address != null) {
      this._address = address;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (language != null) {
      this._language = language;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
    if (rate != null) {
      this._rate = rate;
    }
    if (commentCount != null) {
      this._commentCount = commentCount;
    }
    if (shebaNumber != null) {
      this._shebaNumber = shebaNumber;
    }
    if (bio != null) {
      this._bio = bio;
    }
    if (description != null) {
      this._description = description;
    }
    if (canOnlineReserve != null) {
      this._canOnlineReserve = canOnlineReserve;
    }
    if (canOfflineReserve != null) {
      this._canOfflineReserve = canOfflineReserve;
    }
    if (onlinePrice != null) {
      this._onlinePrice = onlinePrice;
    }
    if (onlinePriceFormatted != null) {
      this._onlinePriceFormatted = onlinePriceFormatted;
    }
    if (offlinePrice != null) {
      this._offlinePrice = offlinePrice;
    }
    if (offlinePriceFormatted != null) {
      this._offlinePriceFormatted = offlinePriceFormatted;
    }
    if (officeNumber != null) {
      this._officeNumber = officeNumber;
    }
    if (insurList != null) {
      this._insurList = insurList;
    }
    if (medicalFields != null) {
      this._medicalFields = medicalFields;
    }
    if (status != null) {
      this._status = status;
    }
    if (bdate != null) {
      this._bdate = bdate;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  Null? get language => _language;
  set language(Null? language) => _language = language;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  double? get rate => _rate;
  set rate(double? rate) => _rate = rate;
  int? get commentCount => _commentCount;
  set commentCount(int? commentCount) => _commentCount = commentCount;
  String? get shebaNumber => _shebaNumber;
  set shebaNumber(String? shebaNumber) => _shebaNumber = shebaNumber;
  String? get bio => _bio;
  set bio(String? bio) => _bio = bio;
  String? get description => _description;
  set description(String? description) => _description = description;
  bool? get canOnlineReserve => _canOnlineReserve;
  set canOnlineReserve(bool? canOnlineReserve) =>
      _canOnlineReserve = canOnlineReserve;
  bool? get canOfflineReserve => _canOfflineReserve;
  set canOfflineReserve(bool? canOfflineReserve) =>
      _canOfflineReserve = canOfflineReserve;
  int? get onlinePrice => _onlinePrice;
  set onlinePrice(int? onlinePrice) => _onlinePrice = onlinePrice;
  String? get onlinePriceFormatted => _onlinePriceFormatted;
  set onlinePriceFormatted(String? onlinePriceFormatted) =>
      _onlinePriceFormatted = onlinePriceFormatted;
  int? get offlinePrice => _offlinePrice;
  set offlinePrice(int? offlinePrice) => _offlinePrice = offlinePrice;
  String? get offlinePriceFormatted => _offlinePriceFormatted;
  set offlinePriceFormatted(String? offlinePriceFormatted) =>
      _offlinePriceFormatted = offlinePriceFormatted;
  String? get officeNumber => _officeNumber;
  set officeNumber(String? officeNumber) => _officeNumber = officeNumber;
  List<InsurModel>? get insurList => _insurList;
  set insurList(List<InsurModel>? insurList) => _insurList = insurList;
  List<MedicalFieldModel>? get medicalFields => _medicalFields;
  set medicalFields(List<MedicalFieldModel>? medicalFields) =>
      _medicalFields = medicalFields;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get bdate => _bdate;
  set bdate(String? bdate) => _bdate = bdate;

  Doctor.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _created = json['created'];
    _updated = json['updated'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _address = json['address'];
    _mobile = json['mobile'];
    _language = json['language'];
    _profileImage = json['profileImage'];
    _rate = json['rate'];
    _commentCount = json['commentCount'];
    _shebaNumber = json['shebaNumber'];
    _bio = json['bio'];
    _description = json['description'];
    _canOnlineReserve = json['canOnlineReserve'];
    _canOfflineReserve = json['canOfflineReserve'];
    _onlinePrice = json['onlinePrice'];
    _onlinePriceFormatted = json['onlinePriceFormatted'];
    _offlinePrice = json['offlinePrice'];
    _offlinePriceFormatted = json['offlinePriceFormatted'];
    _officeNumber = json['officeNumber'];
    if (json['insurList'] != null) {
      _insurList = <InsurModel>[];
      json['insurList'].forEach((v) {
        _insurList!.add(new InsurModel.fromJson(v));
      });
    }
    if (json['medicalFields'] != null) {
      _medicalFields = <MedicalFieldModel>[];
      json['medicalFields'].forEach((v) {
        _medicalFields!.add(new MedicalFieldModel.fromJson(v));
      });
    }
    _status = json['status'];
    _bdate = json['bdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['created'] = this._created;
    data['updated'] = this._updated;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['address'] = this._address;
    data['mobile'] = this._mobile;
    data['language'] = this._language;
    data['profileImage'] = this._profileImage;
    data['rate'] = this._rate;
    data['commentCount'] = this._commentCount;
    data['shebaNumber'] = this._shebaNumber;
    data['bio'] = this._bio;
    data['description'] = this._description;
    data['canOnlineReserve'] = this._canOnlineReserve;
    data['canOfflineReserve'] = this._canOfflineReserve;
    data['onlinePrice'] = this._onlinePrice;
    data['onlinePriceFormatted'] = this._onlinePriceFormatted;
    data['offlinePrice'] = this._offlinePrice;
    data['offlinePriceFormatted'] = this._offlinePriceFormatted;
    data['officeNumber'] = this._officeNumber;
    if (this._insurList != null) {
      data['insurList'] = this._insurList!.map((v) => v.toJson()).toList();
    }
    if (this._medicalFields != null) {
      data['medicalFields'] =
          this._medicalFields!.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    data['bdate'] = this._bdate;
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
