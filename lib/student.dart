class Student {
  String name;
  String email;
  String mobile;
  String gender;
  String courses;
  String address;

//<editor-fold desc="Data Methods">

  Student({
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.courses,
    required this.address,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          mobile == other.mobile &&
          gender == other.gender &&
          courses == other.courses &&
          address == other.address);

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      gender.hashCode ^
      courses.hashCode ^
      address.hashCode;

  @override
  String toString() {
    return 'Student{' +
        ' name: $name,' +
        ' email: $email,' +
        ' mobile: $mobile,' +
        ' gender: $gender,' +
        ' courses: $courses,' +
        ' address: $address,' +
        '}';
  }

  Student copyWith({
    String? name,
    String? email,
    String? mobile,
    String? gender,
    String? courses,
    String? address,
  }) {
    return Student(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      courses: courses ?? this.courses,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'mobile': this.mobile,
      'gender': this.gender,
      'courses': this.courses,
      'address': this.address,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      gender: map['gender'] as String,
      courses: map['courses'] as String,
      address: map['address'] as String,
    );
  }

//</editor-fold>
}