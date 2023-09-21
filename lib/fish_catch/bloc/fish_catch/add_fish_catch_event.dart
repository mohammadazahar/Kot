

abstract class AddFishCatchEvent  {}

class FetchAddFishCatchEventEvent extends AddFishCatchEvent {
  final String? name;
  final String? dateOfCatch;
  final String? timeOfCatch;
  final String? weight;
  final String? length;
  final String? method;
  final String? description;
  final String? position;
  final String? lat;
  final String? lng;
  final String? address;
  final String? images;
  final String? videos;
  final String? species;
  final String? likes;
  final String? createdBy;
  final String? modifiedBy;

  FetchAddFishCatchEventEvent({this.name, this.dateOfCatch, this.timeOfCatch, this.weight, this.length, this.method, this.description, this.position, this.lat, this.lng, this.address, this.images, this.videos, this.species, this.likes, this.createdBy, this.modifiedBy});

  @override
  List<Object> get props => [];
}



