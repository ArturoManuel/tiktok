import 'package:flutter/material.dart';
import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infraestructure/datasources/local_video_posts_datasource_impl.dart';
import 'package:tiktok/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

// se puede colocar lazy:false, puede forzar para que se genere la instancia de provider

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPostsRepositoryImpl videoPostsRepositoryImpl =
        VideoPostsRepositoryImpl(
            videoPostDatasource: LocalVideoPostsDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            //..loadingNexPage es una operación en cascada para que se aplicaque un método defrente de la clase.
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostsRepositoryImpl)
                  ..loadingNexPage())
      ],
      child: MaterialApp(
          title: 'TikTok',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
