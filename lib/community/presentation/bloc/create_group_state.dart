// // ignore_for_file: must_be_immutable
//
// part of 'creating_group_bloc.dart';
//
//
//
//
//
// /// Represents the state of CreatingGroup in the application.
// class CreatingGroupState extends Equatable {
//   CreatingGroupState({
//     this.nameController,
//     this.descriptionController,
//     this.locationController,
//     this.addgrouptopicsController,
//     this.addpeopleController,
//     this.privateController,
//     this.creatingGroupModelObj,
//   });
//
//   TextEditingController? nameController;
//
//   TextEditingController? descriptionController;
//
//   TextEditingController? locationController;
//
//   TextEditingController? addgrouptopicsController;
//
//   TextEditingController? addpeopleController;
//
//   TextEditingController? privateController;
//
//   CreatingGroupModel? creatingGroupModelObj;
//
//   @override
//   List<Object?> get props => [
//         nameController,
//         descriptionController,
//         locationController,
//         addgrouptopicsController,
//         addpeopleController,
//         privateController,
//         creatingGroupModelObj,
//       ];
//   CreatingGroupState copyWith({
//     TextEditingController? nameController,
//     TextEditingController? descriptionController,
//     TextEditingController? locationController,
//     TextEditingController? addgrouptopicsController,
//     TextEditingController? addpeopleController,
//     TextEditingController? privateController,
//     CreatingGroupModel? creatingGroupModelObj,
//   }) {
//     return CreatingGroupState(
//       nameController: nameController ?? this.nameController,
//       descriptionController:
//           descriptionController ?? this.descriptionController,
//       locationController: locationController ?? this.locationController,
//       addgrouptopicsController:
//           addgrouptopicsController ?? this.addgrouptopicsController,
//       addpeopleController: addpeopleController ?? this.addpeopleController,
//       privateController: privateController ?? this.privateController,
//       creatingGroupModelObj:
//           creatingGroupModelObj ?? this.creatingGroupModelObj,
//     );
//   }
// }
