import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_controller.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_icon_widget.dart';

class LogoProfile extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  final userLink;
  LogoProfile({
    Key? key,
    required this.userLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleBox(
          size: 130.w,
          child: CachedNetworkImage(
            imageUrl: userLink,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 90.w,
          top: 85.w,
          child: CircleIconWidget(
            onTap: () {
              controller.chooseImage();
            },
            backgroundColor: primaryColor,
            child: Icon(
              Icons.edit,
              size: 20.w,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
