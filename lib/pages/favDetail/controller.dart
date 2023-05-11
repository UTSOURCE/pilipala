import 'package:get/get.dart';
import 'package:pilipala/http/user.dart';
import 'package:pilipala/models/user/fav_detail.dart';
import 'package:pilipala/models/user/fav_folder.dart';

class FavDetailController extends GetxController {
  FavFolderItemData? item;
  Rx<FavDetailData> favDetailData = FavDetailData().obs;
  int? mediaId;

  @override
  void onInit() {
    item = Get.arguments;
    if (Get.parameters.keys.isNotEmpty) {
      mediaId = int.parse(Get.parameters['mediaId']!);
    }
    super.onInit();
  }

  Future<dynamic> queryUserFavFolderDetail() async {
    var res = await await UserHttp.userFavFolderDetail(
      pn: 1,
      ps: 15,
      mediaId: mediaId!,
    );
    favDetailData.value = res['data'];
    return res;
  }
}
