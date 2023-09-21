import 'package:dio/dio.dart';
import 'package:kot/fish_catch/model/fish_model.dart';
import '../../post/res/const_vals.dart';

class AddFishCatchRepository {
  Future<FishCatchData?> postFishCatchApi({
    required String? name,
    required String? dateOfCatch,
    required String? timeOfCatch,
    required String? weight,
    required String? length,
    required String? method,
    required String? description,
    required String? position,
    required String? lat,
    required String? lng,
    required String? address,
    required String? images,
    required String? videos,
    required String? species,
    required String? likes,
    required String? createdBy,
    required String? modifiedBy,
  }) async {
    try {
      final response =
          await Dio().post('$baseUrl/dev/fishCatch/add-fish-catch', data: {
        "name": name,
        "dateOfCatch": dateOfCatch,
        "timeOfCatch": timeOfCatch,
        "weight": weight,
        "length": length,
        "method": method,
        "description": description,
        "position": {"lat": lat, "lng": lng, "address": address},
        "images": images,
        "videos": videos,
        "species": species,
        "likes": [],
        "createdBy": createdBy,
        "modifiedBy": modifiedBy
      });
      if (response.statusCode == 200) {
        AddFishCatchApiResponseModel addFishCatchApiResponseModel =
            addFishCatchApiResponseModelFromJson(response.toString());
        return addFishCatchApiResponseModel.data;
      } else {
        return null;
      }
    } catch (e) {
      print("AddFishCatch API Error ${e.toString()}");
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
  }
}

// "name": "Big Catch",
// "dateOfCatch": "2023-08-18",
// "timeOfCatch": "12:00 PM",
// "weight": "10 lbs",
// "length": "30 inches",
// "method": "Fishing Rod",
// "description": "Caught a huge fish in the lake.",
// "position": {
// "lat": 37.774929,
// "lng": -122.419416,
// "address": "10, balakrishnan street"
// },
// "images": ["https://5.imimg.com/data5/RO/TR/SX/SELLER-36867365/grasscarp-2-500x500.jpeg"],
// "videos": ["https://images.all-free-download.com/footage_preview/mp4/clip_of_wild_salmon_swimming_under_stream_6892274.mp4"],
// "species": "64e332d3fb5e933cb428909e",
// "likes": [],
// "createdBy": "64a06251ba1b942c8aeeba9e",
// "modifiedBy": "64a06251ba1b942c8aeeba9e"
