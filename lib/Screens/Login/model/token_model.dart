
class TokenModel {
  String? _created;
  String? _id;
  bool? _isSignedUp;
  String? _refreshToken;
  String? _token;
  String? _updated;
  User? _user;

  TokenModel(
      {String? created,
        String? id,
        bool? isSignedUp,
        String? refreshToken,
        String? token,
        String? updated,
        User? user}) {
    if (created != null) {
      this._created = created;
    }
    if (id != null) {
      this._id = id;
    }
    if (isSignedUp != null) {
      this._isSignedUp = isSignedUp;
    }
    if (refreshToken != null) {
      this._refreshToken = refreshToken;
    }
    if (token != null) {
      this._token = token;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (user != null) {
      this._user = user;
    }
  }

  String? get created => _created;
  set created(String? created) => _created = created;
  String? get id => _id;
  set id(String? id) => _id = id;
  bool? get isSignedUp => _isSignedUp;
  set isSignedUp(bool? isSignedUp) => _isSignedUp = isSignedUp;
  String? get refreshToken => _refreshToken;
  set refreshToken(String? refreshToken) => _refreshToken = refreshToken;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  User? get user => _user;
  set user(User? user) => _user = user;

  TokenModel.fromJson(Map<String, dynamic> json) {
    _created = json['created'];
    _id = json['id'];
    _isSignedUp = json['isSignedUp'];
    _refreshToken = json['refreshToken'];
    _token = json['token'];
    _updated = json['updated'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this._created;
    data['id'] = this._id;
    data['isSignedUp'] = this._isSignedUp;
    data['refreshToken'] = this._refreshToken;
    data['token'] = this._token;
    data['updated'] = this._updated;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  String? _address;
  List<Answers>? _answers;
  String? _bdate;
  String? _created;
  String? _email;
  String? _firstName;
  String? _id;
  Language? _language;
  String? _lastName;
  String? _mobile;
  String? _profileImage;
  String? _sex;
  String? _status;
  String? _updated;

  User(
      {String? address,
        List<Answers>? answers,
        String? bdate,
        String? created,
        String? email,
        String? firstName,
        String? id,
        Language? language,
        String? lastName,
        String? mobile,
        String? profileImage,
        String? sex,
        String? status,
        String? updated}) {
    if (address != null) {
      this._address = address;
    }
    if (answers != null) {
      this._answers = answers;
    }
    if (bdate != null) {
      this._bdate = bdate;
    }
    if (created != null) {
      this._created = created;
    }
    if (email != null) {
      this._email = email;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (id != null) {
      this._id = id;
    }
    if (language != null) {
      this._language = language;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (mobile != null) {
      this._mobile = mobile;
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
    if (updated != null) {
      this._updated = updated;
    }
  }

  String? get address => _address;
  set address(String? address) => _address = address;
  List<Answers>? get answers => _answers;
  set answers(List<Answers>? answers) => _answers = answers;
  String? get bdate => _bdate;
  set bdate(String? bdate) => _bdate = bdate;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get id => _id;
  set id(String? id) => _id = id;
  Language? get language => _language;
  set language(Language? language) => _language = language;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  String? get sex => _sex;
  set sex(String? sex) => _sex = sex;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  User.fromJson(Map<String, dynamic> json) {
    _address = json['address'];
    if (json['answers'] != null) {
      _answers = <Answers>[];
      json['answers'].forEach((v) {
        _answers!.add(new Answers.fromJson(v));
      });
    }
    _bdate = json['bdate'];
    _created = json['created'];
    _email = json['email'];
    _firstName = json['firstName'];
    _id = json['id'];
    _language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    _lastName = json['lastName'];
    _mobile = json['mobile'];
    _profileImage = json['profileImage'];
    _sex = json['sex'];
    _status = json['status'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this._address;
    if (this._answers != null) {
      data['answers'] = this._answers!.map((v) => v.toJson()).toList();
    }
    data['bdate'] = this._bdate;
    data['created'] = this._created;
    data['email'] = this._email;
    data['firstName'] = this._firstName;
    data['id'] = this._id;
    if (this._language != null) {
      data['language'] = this._language!.toJson();
    }
    data['lastName'] = this._lastName;
    data['mobile'] = this._mobile;
    data['profileImage'] = this._profileImage;
    data['sex'] = this._sex;
    data['status'] = this._status;
    data['updated'] = this._updated;
    return data;
  }
}

class Answers {
  String? _answer;
  String? _created;
  String? _id;
  Question? _question;
  String? _updated;
  bool? _verified;

  Answers(
      {String? answer,
        String? created,
        String? id,
        Question? question,
        String? updated,
        bool? verified}) {
    if (answer != null) {
      this._answer = answer;
    }
    if (created != null) {
      this._created = created;
    }
    if (id != null) {
      this._id = id;
    }
    if (question != null) {
      this._question = question;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (verified != null) {
      this._verified = verified;
    }
  }

  String? get answer => _answer;
  set answer(String? answer) => _answer = answer;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get id => _id;
  set id(String? id) => _id = id;
  Question? get question => _question;
  set question(Question? question) => _question = question;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  bool? get verified => _verified;
  set verified(bool? verified) => _verified = verified;

  Answers.fromJson(Map<String, dynamic> json) {
    _answer = json['answer'];
    _created = json['created'];
    _id = json['id'];
    _question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    _updated = json['updated'];
    _verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this._answer;
    data['created'] = this._created;
    data['id'] = this._id;
    if (this._question != null) {
      data['question'] = this._question!.toJson();
    }
    data['updated'] = this._updated;
    data['verified'] = this._verified;
    return data;
  }
}

class Question {
  bool? _hidden;
  String? _id;
  String? _title;

  Question({bool? hidden, String? id, String? title}) {
    if (hidden != null) {
      this._hidden = hidden;
    }
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
  }

  bool? get hidden => _hidden;
  set hidden(bool? hidden) => _hidden = hidden;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;

  Question.fromJson(Map<String, dynamic> json) {
    _hidden = json['hidden'];
    _id = json['id'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hidden'] = this._hidden;
    data['id'] = this._id;
    data['title'] = this._title;
    return data;
  }
}

class Language {
  String? _created;
  String? _direction;
  String? _id;
  String? _name;
  String? _updated;

  Language(
      {String? created,
        String? direction,
        String? id,
        String? name,
        String? updated}) {
    if (created != null) {
      this._created = created;
    }
    if (direction != null) {
      this._direction = direction;
    }
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (updated != null) {
      this._updated = updated;
    }
  }

  String? get created => _created;
  set created(String? created) => _created = created;
  String? get direction => _direction;
  set direction(String? direction) => _direction = direction;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  Language.fromJson(Map<String, dynamic> json) {
    _created = json['created'];
    _direction = json['direction'];
    _id = json['id'];
    _name = json['name'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this._created;
    data['direction'] = this._direction;
    data['id'] = this._id;
    data['name'] = this._name;
    data['updated'] = this._updated;
    return data;
  }
}
