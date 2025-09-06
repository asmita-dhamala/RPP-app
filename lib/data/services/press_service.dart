import 'package:raparva_app/core/constants/api_constants.dart';
import '../../core/utils/api_util.dart';
import '../models/press_model.dart';

class PressReleaseService {
  static Future<List<PressReleaseModel>> fetchPressReleases() async {
    final json = await ApiUtil.get(ApiConstants.pressRelease, useRawUrl: true);
    final List data = json['data'] ?? [];
    return data.map((e) => PressReleaseModel.fromJson(e)).toList();
  }
}
