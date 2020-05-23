import 'package:platzitripsapp/User/model/user.dart';
import 'package:platzitripsapp/User/repository/cloud_firestone_api.dart';

class CloudFirestoneRepository {
  final CloudFirestoneApi _cloudFirestoneApi = CloudFirestoneApi();

  void updateUserDataFirestone(User user) => _cloudFirestoneApi.updateUserData(user);
}