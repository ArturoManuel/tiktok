import 'package:tiktok/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
