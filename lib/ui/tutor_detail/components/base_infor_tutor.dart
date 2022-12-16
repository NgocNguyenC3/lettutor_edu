import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';

import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';

import 'package:lettutor_edu_clone/widgets/icon/icon_text.dart';

class BaseInforTutor extends StatelessWidget {
  final controller = Get.find<TutorDetailController>();
  final languages = Get.find<AppController>().languagesContry;

  BaseInforTutor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tutor tutor = controller.tutor.value;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleBox(
                    size: 110.w,
                    child: CachedNetworkImage(
                        imageUrl: tutor.userModel!.avatar, fit: BoxFit.cover)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor.userModel!.name,
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RatingBar.builder(
                      initialRating: tutor.rating,
                      minRating: tutor.rating,
                      maxRating: tutor.rating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                        SizedBox(width: 15.w),
                        Text(
                          languages[tutor.userModel!.country.toLowerCase()] ??
                              tutor.userModel!.country,
                          style: text16,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            tutor.bio,
            style: text16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => IconText(
                  onTap: controller.onTapFavorite,
                  iconData: Icons.favorite,
                  title: LocalString.favorite,
                  color: controller.isFavorite.value ? Colors.red : null,
                ),
              ),
              IconText(
                onTap: controller.report,
                iconData: Icons.report,
                title: LocalString.report,
              ),
              IconText(
                onTap: () {
                  controller.review();
                },
                iconData: Icons.star,
                title: LocalString.reviews,
              ),
            ],
          )
        ],
      ),
    );
  }
}
