import 'package:flutter/material.dart';

import '../data/models/song_model.dart';
import 'custom_image_widget.dart';

class BackgroundFilterWidget extends StatelessWidget {
  const BackgroundFilterWidget({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: song.title,
          child: CustomImageWidget(
            image: song?.coverUrl ?? "",
            type: ImageFileType.assets,
            fit: BoxFit.cover,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.dstOut,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.0)
                ],
                stops: const [
                  0.0,
                  0.4,
                  0.6
                ]).createShader(bounds);
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade800],
            )),
          ),
        )
      ],
    );
  }
}
