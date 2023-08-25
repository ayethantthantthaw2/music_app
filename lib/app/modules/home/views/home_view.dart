import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/src/app_decorations.dart';
import 'package:music_app/app/src/app_spacings.dart';
import 'package:music_app/app/widgets/custom_app_bar.dart';
import 'package:music_app/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:music_app/app/widgets/discover_music_widget.dart';
import 'package:music_app/app/widgets/playlist_list_widget.dart';
import 'package:music_app/app/widgets/section_header.dart';
import '../../../widgets/trending_music_list _widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.gradientDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
            child: Column(
              children: [
                const DiscoverMusicWidget(),
                const SizedBox(height: AppSpacing.m),
                const SectionHeader(
                    title: "Trending Music", action: 'View More'),
                const SizedBox(height: AppSpacing.m),
                TrendingMusicListWidget(
                  songs: controller.songs ?? [],
                ),
                const SizedBox(height: AppSpacing.m),
                const SectionHeader(title: "Playlists", action: 'View More'),
                const SizedBox(height: AppSpacing.s),
                PlayListWidget(
                  playlist: controller.playlists ?? [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
