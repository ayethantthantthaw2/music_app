import 'package:flutter/material.dart';
import 'package:music_app/app/src/app_sizes.dart';
import 'package:music_app/app/src/app_spacings.dart';
import 'package:music_app/app/widgets/custom_image_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: AppSpacing.m),
          child: const ClipOval(
            child: CustomImageWidget(
              image:
                  'https://img.freepik.com/premium-vector/hand-drawing-cartoon-girl-cute-girl-drawing-profile-picture_488586-692.jpg?w=2000',
              type: ImageFileType.network,
              width: AppSizes.x4l,
              height: AppSizes.x4l,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.x4l);
}
