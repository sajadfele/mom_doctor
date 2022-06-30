import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/Screens/Profile/model/medical_fields_model.dart';

class DoctorModel {
  String? _address;
  String? _bdate;
  String? _bio;
  bool? _canOfflineReserve;
  bool? _canOnlineReserve;
  int? _commentCount;
  String? _created;
  String? _description;
  String? _email;
  String? _firstName;
  String? _id;
  List<InsurModel>? _insurList;
  Language? _language;
  String? _lastName;
  List<MedicalFieldModel>? _medicalFields;
  String? _mobile;
  String? _officeNumber;
  int? _offlinePrice;
  String? _offlinePriceFormatted;
  int? _onlinePrice;
  String? _onlinePriceFormatted;
  String? _profileImage;
  double? _rate;
  String? _shebaNumber;
  String? _status;
  String? _updated;

  DoctorModel(
      {String? address,
        String? bdate,
        String? bio,
        bool? canOfflineReserve,
        bool? canOnlineReserve,
        int? commentCount,
        String? created,
        String? description,
        String? email,
        String? firstName,
        String? id,
        List<InsurModel>? insurList,
        Language? language,
        String? lastName,
        List<MedicalFieldModel>? medicalFields,
        String? mobile,
        String? officeNumber,
        int? offlinePrice,
        String? offlinePriceFormatted,
        int? onlinePrice,
        String? onlinePriceFormatted,
        String? profileImage,
        double? rate,
        String? shebaNumber,
        String? status,
        String? updated}) {
    if (address != null) {
      this._address = address;
    }
    if (bdate != null) {
      this._bdate = bdate;
    }
    if (bio != null) {
      this._bio = bio;
    }
    if (canOfflineReserve != null) {
      this._canOfflineReserve = canOfflineReserve;
    }
    if (canOnlineReserve != null) {
      this._canOnlineReserve = canOnlineReserve;
    }
    if (commentCount != null) {
      this._commentCount = commentCount;
    }
    if (created != null) {
      this._created = created;
    }
    if (description != null) {
      this._description = description;
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
    if (insurList != null) {
      this._insurList = insurList;
    }
    if (language != null) {
      this._language = language;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (medicalFields != null) {
      this._medicalFields = medicalFields;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (officeNumber != null) {
      this._officeNumber = officeNumber;
    }
    if (offlinePrice != null) {
      this._offlinePrice = offlinePrice;
    }
    if (offlinePriceFormatted != null) {
      this._offlinePriceFormatted = offlinePriceFormatted;
    }
    if (onlinePrice != null) {
      this._onlinePrice = onlinePrice;
    }
    if (onlinePriceFormatted != null) {
      this._onlinePriceFormatted = onlinePriceFormatted;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
    if (rate != null) {
      this._rate = rate;
    }
    if (shebaNumber != null) {
      this._shebaNumber = shebaNumber;
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
  String? get bdate => _bdate;
  set bdate(String? bdate) => _bdate = bdate;
  String? get bio => _bio;
  set bio(String? bio) => _bio = bio;
  bool? get canOfflineReserve => _canOfflineReserve;
  set canOfflineReserve(bool? canOfflineReserve) =>
      _canOfflineReserve = canOfflineReserve;
  bool? get canOnlineReserve => _canOnlineReserve;
  set canOnlineReserve(bool? canOnlineReserve) =>
      _canOnlineReserve = canOnlineReserve;
  int? get commentCount => _commentCount;
  set commentCount(int? commentCount) => _commentCount = commentCount;
  String? get created => _created;
  set created(String? created) => _created = created;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get id => _id;
  set id(String? id) => _id = id;
  List<InsurModel>? get insurList => _insurList;
  set insurList(List<InsurModel>? insurList) => _insurList = insurList;
  Language? get language => _language;
  set language(Language? language) => _language = language;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  List<MedicalFieldModel>? get medicalFields => _medicalFields;
  set medicalFields(List<MedicalFieldModel>? medicalFields) =>
      _medicalFields = medicalFields;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get officeNumber => _officeNumber;
  set officeNumber(String? officeNumber) => _officeNumber = officeNumber;
  int? get offlinePrice => _offlinePrice;
  set offlinePrice(int? offlinePrice) => _offlinePrice = offlinePrice;
  String? get offlinePriceFormatted => _offlinePriceFormatted;
  set offlinePriceFormatted(String? offlinePriceFormatted) =>
      _offlinePriceFormatted = offlinePriceFormatted;
  int? get onlinePrice => _onlinePrice;
  set onlinePrice(int? onlinePrice) => _onlinePrice = onlinePrice;
  String? get onlinePriceFormatted => _onlinePriceFormatted;
  set onlinePriceFormatted(String? onlinePriceFormatted) =>
      _onlinePriceFormatted = onlinePriceFormatted;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  double? get rate => _rate;
  set rate(double? rate) => _rate = rate;
  String? get shebaNumber => _shebaNumber;
  set shebaNumber(String? shebaNumber) => _shebaNumber = shebaNumber;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  DoctorModel.fromJson(Map<String, dynamic> json) {
    _address = json['address'];
    _bdate = json['bdate'];
    _bio = json['bio'];
    _canOfflineReserve = json['canOfflineReserve'];
    _canOnlineReserve = json['canOnlineReserve'];
    _commentCount = json['commentCount'];
    _created = json['created'];
    _description = json['description'];
    _email = json['email'];
    _firstName = json['firstName'];
    _id = json['id'];
    if (json['insurList'] != null) {
      _insurList = <InsurModel>[];
      json['insurList'].forEach((v) {
        _insurList!.add(new InsurModel.fromJson(v));
      });
    }
    _language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    _lastName = json['lastName'];
    if (json['medicalFields'] != null) {
      _medicalFields = <MedicalFieldModel>[];
      json['medicalFields'].forEach((v) {
        _medicalFields!.add(new MedicalFieldModel.fromJson(v));
      });
    }
    _mobile = json['mobile'];
    _officeNumber = json['officeNumber'];
    _offlinePrice = json['offlinePrice'];
    _offlinePriceFormatted = json['offlinePriceFormatted'];
    _onlinePrice = json['onlinePrice'];
    _onlinePriceFormatted = json['onlinePriceFormatted'];
    _profileImage = json['profileImage'];
    _rate = json['rate'];
    _shebaNumber = json['shebaNumber'];
    _status = json['status'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this._address;
    data['bdate'] = this._bdate;
    data['bio'] = this._bio;
    data['canOfflineReserve'] = this._canOfflineReserve;
    data['canOnlineReserve'] = this._canOnlineReserve;
    data['commentCount'] = this._commentCount;
    data['created'] = this._created;
    data['description'] = this._description;
    data['email'] = this._email;
    data['firstName'] = this._firstName;
    data['id'] = this._id;
    if (this._insurList != null) {
      data['insurList'] = this._insurList!.map((v) => v.toJson()).toList();
    }
    if (this._language != null) {
      data['language'] = this._language!.toJson();
    }
    data['lastName'] = this._lastName;
    if (this._medicalFields != null) {
      data['medicalFields'] =
          this._medicalFields!.map((v) => v.toJson()).toList();
    }
    data['mobile'] = this._mobile;
    data['officeNumber'] = this._officeNumber;
    data['offlinePrice'] = this._offlinePrice;
    data['offlinePriceFormatted'] = this._offlinePriceFormatted;
    data['onlinePrice'] = this._onlinePrice;
    data['onlinePriceFormatted'] = this._onlinePriceFormatted;
    data['profileImage'] = this._profileImage;
    data['rate'] = this._rate;
    data['shebaNumber'] = this._shebaNumber;
    data['status'] = this._status;
    data['updated'] = this._updated;
    return data;
  }
}

class InsurList {
  String? _created;
  String? _id;
  String? _logo;
  String? _name;
  String? _updated;

  InsurList(
      {String? created,
        String? id,
        String? logo,
        String? name,
        String? updated}) {
    if (created != null) {
      this._created = created;
    }
    if (id != null) {
      this._id = id;
    }
    if (logo != null) {
      this._logo = logo;
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
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  InsurList.fromJson(Map<String, dynamic> json) {
    _created = json['created'];
    _id = json['id'];
    _logo = json['logo'];
    _name = json['name'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this._created;
    data['id'] = this._id;
    data['logo'] = this._logo;
    data['name'] = this._name;
    data['updated'] = this._updated;
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

class MedicalFields {
  String? _created;
  String? _id;
  String? _name;
  String? _updated;

  MedicalFields({String? created, String? id, String? name, String? updated}) {
    if (created != null) {
      this._created = created;
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
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  MedicalFields.fromJson(Map<String, dynamic> json) {
    _created = json['created'];
    _id = json['id'];
    _name = json['name'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this._created;
    data['id'] = this._id;
    data['name'] = this._name;
    data['updated'] = this._updated;
    return data;
  }
}
