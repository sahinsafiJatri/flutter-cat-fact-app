class CatFactsEntity {
  CatFactsEntity({
      Status? status, 
      String? id, 
      String? user, 
      String? text, 
      num? v, 
      String? source, 
      String? updatedAt, 
      String? type, 
      String? createdAt, 
      bool? deleted, 
      bool? used,}){
    _status = status;
    _id = id;
    _user = user;
    _text = text;
    _v = v;
    _source = source;
    _updatedAt = updatedAt;
    _type = type;
    _createdAt = createdAt;
    _deleted = deleted;
    _used = used;
}

  CatFactsEntity.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _id = json['_id'];
    _user = json['user'];
    _text = json['text'];
    _v = json['__v'];
    _source = json['source'];
    _updatedAt = json['updatedAt'];
    _type = json['type'];
    _createdAt = json['createdAt'];
    _deleted = json['deleted'];
    _used = json['used'];
  }

  Status? _status;
  String? _id;
  String? _user;
  String? _text;
  num? _v;
  String? _source;
  String? _updatedAt;
  String? _type;
  String? _createdAt;
  bool? _deleted;
  bool? _used;

  Status? get status => _status ?? Status();
  String? get id => _id ?? "";
  String? get user => _user ?? "";
  String? get text => _text ?? "";
  num? get v => _v ?? -1;
  String? get source => _source ?? "";
  String? get updatedAt => _updatedAt ?? "";
  String? get type => _type ?? "";
  String? get createdAt => _createdAt ?? "";
  bool? get deleted => _deleted ?? false;
  bool? get used => _used ?? false;
}

class Status {
  Status({
      bool? verified, 
      num? sentCount,}){
    _verified = verified;
    _sentCount = sentCount;
}

  Status.fromJson(dynamic json) {
    _verified = json['verified'];
    _sentCount = json['sentCount'];
  }

  bool? _verified;
  num? _sentCount;

  bool? get verified => _verified ?? false;
  num? get sentCount => _sentCount ?? -1;


}