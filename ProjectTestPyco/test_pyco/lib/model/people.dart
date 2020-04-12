class DataTinder {
  List<People> _results;
  Info _info;

  DataTinder({List<People> results, Info info}) {
    this._results = results;
    this._info = info;
  }

  List<People> get results => _results;

  set results(List<People> results) => _results = results;

  Info get info => _info;

  set info(Info info) => _info = info;

  DataTinder.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = new List<People>();
      json['results'].forEach((v) {
        _results.add(new People.fromJson(v));
      });
    }

    _info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    if (this._info != null) {
      data['info'] = this._info.toJson();
    }
    return data;
  }
}

class People {
  String _gender;
  Name _name;
  Location _location;
  String _email;
  Login _login;
  String _dob;
  String _registered;
  String _phone;
  String _cell;
  Id _id;
  Picture _picture;
  String _nat;

  People(
      {String gender,
      Name name,
      Location location,
      String email,
      Login login,
      String dob,
      String registered,
      String phone,
      String cell,
      Id id,
      Picture picture,
      String nat}) {
    this._gender = gender;
    this._name = name;
    this._location = location;
    this._email = email;
    this._login = login;
    this._dob = dob;
    this._registered = registered;
    this._phone = phone;
    this._cell = cell;
    this._id = id;
    this._picture = picture;
    this._nat = nat;
  }

  String get gender => _gender;

  set gender(String gender) => _gender = gender;

  Name get name => _name;

  set name(Name name) => _name = name;

  Location get location => _location;

  set location(Location location) => _location = location;

  String get email => _email;

  set email(String email) => _email = email;

  Login get login => _login;

  set login(Login login) => _login = login;

  String get dob => _dob;

  set dob(String dob) => _dob = dob;

  String get registered => _registered;

  set registered(String registered) => _registered = registered;

  String get phone => _phone;

  set phone(String phone) => _phone = phone;

  String get cell => _cell;

  set cell(String cell) => _cell = cell;

  Id get id => _id;

  set id(Id id) => _id = id;

  Picture get picture => _picture;

  set picture(Picture picture) => _picture = picture;

  String get nat => _nat;

  set nat(String nat) => _nat = nat;

  People.fromJson(Map<String, dynamic> json) {
    _gender = json['gender'];
    _name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _email = json['email'];
    _login = json['login'] != null ? new Login.fromJson(json['login']) : null;
    _dob = json['dob'];
    _registered = json['registered'];
    _phone = json['phone'];
    _cell = json['cell'];
    _id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    _picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    _nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this._gender;
    if (this._name != null) {
      data['name'] = this._name.toJson();
    }
    if (this._location != null) {
      data['location'] = this._location.toJson();
    }
    data['email'] = this._email;
    if (this._login != null) {
      data['login'] = this._login.toJson();
    }
    data['dob'] = this._dob;
    data['registered'] = this._registered;
    data['phone'] = this._phone;
    data['cell'] = this._cell;
    if (this._id != null) {
      data['id'] = this._id.toJson();
    }
    if (this._picture != null) {
      data['picture'] = this._picture.toJson();
    }
    data['nat'] = this._nat;
    return data;
  }
}

class Name {
  String _title;
  String _first;
  String _last;

  Name({String title, String first, String last}) {
    this._title = title;
    this._first = first;
    this._last = last;
  }

  String get title => _title;

  set title(String title) => _title = title;

  String get first => _first;

  set first(String first) => _first = first;

  String get last => _last;

  set last(String last) => _last = last;

  Name.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _first = json['first'];
    _last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['first'] = this._first;
    data['last'] = this._last;
    return data;
  }
}

class Location {
  String _street;
  String _city;
  String _state;
  int _postcode;

  Location({String street, String city, String state, int postcode}) {
    this._street = street;
    this._city = city;
    this._state = state;
    this._postcode = postcode;
  }

  String get street => _street;

  set street(String street) => _street = street;

  String get city => _city;

  set city(String city) => _city = city;

  String get state => _state;

  set state(String state) => _state = state;

  int get postcode => _postcode;

  set postcode(int postcode) => _postcode = postcode;

  Location.fromJson(Map<String, dynamic> json) {
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this._street;
    data['city'] = this._city;
    data['state'] = this._state;
    data['postcode'] = this._postcode;
    return data;
  }
}

class Login {
  String _username;
  String _password;
  String _salt;
  String _md5;
  String _sha1;
  String _sha256;

  Login(
      {String username,
      String password,
      String salt,
      String md5,
      String sha1,
      String sha256}) {
    this._username = username;
    this._password = password;
    this._salt = salt;
    this._md5 = md5;
    this._sha1 = sha1;
    this._sha256 = sha256;
  }

  String get username => _username;

  set username(String username) => _username = username;

  String get password => _password;

  set password(String password) => _password = password;

  String get salt => _salt;

  set salt(String salt) => _salt = salt;

  String get md5 => _md5;

  set md5(String md5) => _md5 = md5;

  String get sha1 => _sha1;

  set sha1(String sha1) => _sha1 = sha1;

  String get sha256 => _sha256;

  set sha256(String sha256) => _sha256 = sha256;

  Login.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
    _salt = json['salt'];
    _md5 = json['md5'];
    _sha1 = json['sha1'];
    _sha256 = json['sha256'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['password'] = this._password;
    data['salt'] = this._salt;
    data['md5'] = this._md5;
    data['sha1'] = this._sha1;
    data['sha256'] = this._sha256;
    return data;
  }
}

class Id {
  String _name;
  String _value;

  Id({String name, String value}) {
    this._name = name;
    this._value = value;
  }

  String get name => _name;

  set name(String name) => _name = name;

  String get value => _value;

  set value(String value) => _value = value;

  Id.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['value'] = this._value;
    return data;
  }
}

class Picture {
  String _large;
  String _medium;
  String _thumbnail;

  Picture({String large, String medium, String thumbnail}) {
    this._large = large;
    this._medium = medium;
    this._thumbnail = thumbnail;
  }

  String get large => _large;

  set large(String large) => _large = large;

  String get medium => _medium;

  set medium(String medium) => _medium = medium;

  String get thumbnail => _thumbnail;

  set thumbnail(String thumbnail) => _thumbnail = thumbnail;

  Picture.fromJson(Map<String, dynamic> json) {
    _large = json['large'];
    _medium = json['medium'];
    _thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this._large;
    data['medium'] = this._medium;
    data['thumbnail'] = this._thumbnail;
    return data;
  }
}

class Info {
  String _seed;
  int _results;
  int _page;
  String _version;

  Info({String seed, int results, int page, String version}) {
    this._seed = seed;
    this._results = results;
    this._page = page;
    this._version = version;
  }

  String get seed => _seed;

  set seed(String seed) => _seed = seed;

  int get results => _results;

  set results(int results) => _results = results;

  int get page => _page;

  set page(int page) => _page = page;

  String get version => _version;

  set version(String version) => _version = version;

  Info.fromJson(Map<String, dynamic> json) {
    _seed = json['seed'];
    _results = json['results'];
    _page = json['page'];
    _version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seed'] = this._seed;
    data['results'] = this._results;
    data['page'] = this._page;
    data['version'] = this._version;
    return data;
  }
}
