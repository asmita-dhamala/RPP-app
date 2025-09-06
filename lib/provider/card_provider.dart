// // lib/application/providers/content_providers.dart

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:raparva_app/data/models/all_card_models.dart';
// import 'package:raparva_app/data/repositories/card_repo.dart';
// import 'package:raparva_app/data/services/card_api.dart';

// /// Provider for the API Service
// final contentApiService = Provider<ContentApiService>((ref) {
//   return ContentApiService();
// });

// /// Provider for the Repository (depends on API Service)
// final contentRepositoryProvider = Provider<ContentRepository>((ref) {
//   return ContentRepositoryImpl(ref.read(contentApiService));
// });

// /// FutureProvider for Press Releases with PressReleaseModel
// final pressReleaseProvider = FutureProvider.autoDispose<ContentSectionModel<ContentItemModel>>((ref) async {
//   return ref.read(contentRepositoryProvider).getPressReleases();
// });

// /// FutureProvider for Speeches with GalleryItemModel
// final speechesProvider = FutureProvider.autoDispose<ContentSectionModel<ContentItemModel>>((ref) async {
//   return ref.read(contentRepositoryProvider).getSpeeches();
// });

// /// FutureProvider for Articles with GalleryItemModel
// final articlesProvider = FutureProvider.autoDispose<ContentSectionModel<ContentItemModel>>((ref) async {
//   return ref.read(contentRepositoryProvider).getArticles();
// });

// /// FutureProvider for Photo Gallery with GalleryItemModel
// final photoGalleryProvider = FutureProvider.autoDispose<ContentSectionModel<ContentItemModel>>((ref) async {
//   return ref.read(contentRepositoryProvider).getPhotoGallery();
// });

// /// FutureProvider for Video Gallery with GalleryItemModel
// final videoGalleryProvider = FutureProvider.autoDispose<ContentSectionModel<ContentItemModel>>((ref) async {
//   return ref.read(contentRepositoryProvider).getVideoGallery();
// });
