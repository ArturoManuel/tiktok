import 'package:flutter/material.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    //son las mismas
    //final otroProvide = Provider.of<DiscoverProvider>(context,listen:false);

    return Scaffold(
        body: discoverProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : VideoScrollableView(videos: discoverProvider.videos));
  }
}
