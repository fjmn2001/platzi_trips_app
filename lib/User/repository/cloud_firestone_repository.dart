import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzitripsapp/Place/model/place.dart';
import 'package:platzitripsapp/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_api.dart';
import 'package:platzitripsapp/User/ui/widgets/profile_place.dart';

class CloudFirestoneRepository {
  final CloudFirestoneApi _cloudFirestoneApi = CloudFirestoneApi();

  void updateUserDataFirestone(User user) => _cloudFirestoneApi.updateUserData(user);

  Future<void> updatePlaceData(Place place) => _cloudFirestoneApi.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces (List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoneApi.buildMyPlaces(placesListSnapshot);
  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoneApi.buildPlaces(placesListSnapshot);
}