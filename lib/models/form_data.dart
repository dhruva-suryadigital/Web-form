enum Gender {
  male,
  female,
  other,
}

class FormResponse {
  Gender? gender;
  String? name;
  String? dob;
  String? opinion;
  String? country;

  FormResponse({
    this.name,
    this.dob,
    this.gender,
    this.opinion,
    this.country,
  });

  FormResponse copyWith({
    String? name,
    String? dob,
    Gender? gender,
    String? opinion,
    String? country,
  }) =>
      FormResponse(
        name: name ?? this.name,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        opinion: opinion ?? this.opinion,
        country: country ?? this.country,
      );
}
