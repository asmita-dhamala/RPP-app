// // lib/data/repositories/content_repository.dart
// import 'package:raparva_app/data/models/all_card_models.dart';
// import 'package:raparva_app/data/services/card_api.dart';

// abstract class ContentRepository {
//   Future<ContentSectionModel<PressReleaseModel>> getPressReleases(); // Changed return type
//   Future<ContentSectionModel<ContentItemModel>> getSpeeches();        // Changed return type
//   Future<ContentSectionModel<ContentItemModel>> getArticles();        // Changed return type
//   Future<ContentSectionModel<ContentItemModel>> getPhotoGallery();    // Changed return type
//   Future<ContentSectionModel<ContentItemModel>> getVideoGallery();    // Changed return type
// }

// class ContentRepositoryImpl implements ContentRepository {
//   final ContentApiService _apiService;

//   ContentRepositoryImpl(this._apiService);

//   @override
//   Future<ContentSectionModel<ContentItemModel>> getPressReleases() async {
//     return await _apiService.fetchPressReleases(); // Return the whole model
//   }

//   @override
//   Future<ContentSectionModel<ContentItemModel>> getSpeeches() async {
//     return await _apiService.fetchSpeeches(); // Return the whole model
//   }

//   @override
//   Future<ContentSectionModel<ContentItemModel>> getArticles() async {
//     return await _apiService.fetchArticles(); // Return the whole model
//   }

//   @override
//   Future<ContentSectionModel<ContentItemModel>> getVideoGallery() async {
//     return await _apiService.fetchVideoGallery(); // Return the whole model
//   }

//   @override
//   Future<ContentSectionModel<ContentItemModel>> getPhotoGallery() async {
//     return await _apiService.fetchPhotoGallery(); // Return the whole model
//   }
// }