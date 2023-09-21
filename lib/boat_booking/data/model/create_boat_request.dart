class BoatRequest {
   String? boatType;
   String? pricePerDay;
   int? length;
   int? cabins;
   int? births;
   int? capacity;
   int? kitchen;
   int? bathroom;
   bool? shower;
   int? motorPower;
   bool? hasCaptain;
   bool? superOwner;
   DateTime? fromDate;
   DateTime? toDate;

  BoatRequest({
     this.boatType,
     this.pricePerDay,
     this.length,
     this.cabins,
     this.births,
     this.capacity,
     this.kitchen,
     this.bathroom,
     this.shower,
     this.motorPower,
     this.hasCaptain,
     this.superOwner,
     this.fromDate,
     this.toDate,
  });

  factory BoatRequest.fromJson(Map<String, dynamic> json) {
    return BoatRequest(
      boatType: json['boatType'],
      pricePerDay: json['pricePerDay'],
      length: json['length'],
      cabins: json['cabins'],
      births: json['births'],
      capacity: json['capacity'],
      kitchen: json['kitchen'],
      bathroom: json['bathroom'],
      shower: json['shower'],
      motorPower: json['motorPower'],
      hasCaptain: json['hasCaptain'],
      superOwner: json['superOwner'],
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'boatType': boatType,
      'pricePerDay': pricePerDay,
      'length': length,
      'cabins': cabins,
      'births': births,
      'capacity': capacity,
      'kitchen': kitchen,
      'bathroom': bathroom,
      'shower': shower,
      'motorPower': motorPower,
      'hasCaptain': hasCaptain,
      'superOwner': superOwner,
      'fromDate': fromDate?.toIso8601String(),
      'toDate': toDate?.toIso8601String(),
    };
  }
}
