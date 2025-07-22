import 'package:calafi/api/user/countFollow.dart';
import 'package:calafi/models/user/getFollows.dart';
import 'package:calafi/models/user/getfollowModel.dart';
import 'package:get/get.dart';
import 'package:calafi/api/follow/getFollowUser.dart';

class ProfileFollowController extends GetxController {
  RxList<getUserFollowModel> getFollowData = <getUserFollowModel>[].obs;
  RxList<getUserFollowModel> getFollowingData = <getUserFollowModel>[].obs;
  Rxn<GetfollowsModel> getCountData = Rxn<GetfollowsModel>();
  RxBool isLoading = true.obs; // 추가

  void fetchUserCount(int userId) async {
    final countfollow = Countfollow(id: userId);
    getCountData.value = await countfollow.user_get();
  }

  void fetchUserFollows(int userId, String token) async {
    isLoading.value = true;
    final userfollow = Getfollowuser(id: userId, token: token);
    getFollowingData.value = await userfollow.GetFollowing_get();
    getFollowData.value = await userfollow.GetFollow_get();
    isLoading.value = false;
  }
}
