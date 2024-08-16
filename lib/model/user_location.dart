class UserLocation {
  String city;
  String state;
  String country;
  String postcode; // Changed to String
  LocationStreet street;
  LocationCoordinate coordinates; // Updated name to match JSON key
  LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });
  factory UserLocation.fromMap(Map<String, dynamic> json){
      final coordinate = LocationCoordinate.fromJson(json['coordinates']);
      final street = LocationStreet.fromMap(json['street']);
      final timezone = LocationTimezone.fromMap(json['timezone']);
      return UserLocation(
        city: json['city'] ?? '',
        state: json['state'] ?? '',
        country: json['country'] ?? '',
        postcode: json['postcode']?.toString() ??'', // Convert postcode to String
        street: street,
        coordinates: coordinate,
        timezone: timezone,
      );
  }
}

class LocationStreet {
  late final int number;
  late final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json){
    final streetJson = json['street'] ?? {};
    return LocationStreet(
      number: streetJson['number'] ?? 0,
      name: streetJson['name'] ?? '',
    );
  }
}

class LocationCoordinate {
  late final String latitude;
  late final String longitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromJson(Map<String, dynamic>? json) {
    return LocationCoordinate(
      latitude: json?['latitude']?.toString() ?? '0.0', // Default to '0.0'
      longitude: json?['longitude']?.toString() ?? '0.0', // Default to '0.0'
    );
  }
}

class LocationTimezone {
  late final String offset;
  late final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> json){
    return LocationTimezone(
        offset: json['offset'] ?? '',
        description: json['description'] ?? '',
      );
  }
}
