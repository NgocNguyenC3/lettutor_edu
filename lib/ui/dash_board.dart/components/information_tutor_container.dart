// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';

import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';

class InformationTutorContainer extends StatelessWidget {
  final languages = Get.find<AppController>().languagesContry;
  final controller = Get.find<DashBoardController>();
  Tutor tutor;
  InformationTutorContainer({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = tutor.user ?? UserModel(birthday: DateTime(1990));
    return InkWell(
      onTap: () {
        controller.navigateTutorDetail(tutor);
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
            child: BoxShadowContainer(
                padding: EdgeInsets.all(30.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                width: Get.width - 20.w - 6.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleBox(
                          size: 80.w,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: 80.w,
                            width: 80.w,
                            imageUrl: user.avatar,
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      user.name,
                      style: text20.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                        SizedBox(width: 15.w),
                        Text(
                          languages[user.country.toLowerCase()] ?? user.country,
                          style: text16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    tutor.rating == 0
                        ? Text(
                            LocalString.dashBoardNoReview,
                            style: text16.copyWith(color: Colors.grey),
                          )
                        : RatingBar.builder(
                            initialRating: tutor.rating,
                            minRating: tutor.rating,
                            maxRating: tutor.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 5,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Wrap(
                      spacing: 5.w,
                      runSpacing: 10.h,
                      children: [
                        ...tutor.specialties
                            .split(',')
                            .map((e) => TextContainer(
                                  title: e,
                                  textColor: primaryColor,
                                  color: primaryColor.withOpacity(0.2),
                                ))
                            .toList()
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      tutor.bio,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: Get.width / 2 - 30.w,
                        child: LoadingButtonWidget(
                            submit: () {
                              controller.navigateTutorDetail(tutor);
                            },
                            height: 30.h,
                            isLoading: false,
                            primaryColor: primaryColor.withOpacity(0.5),
                            label: LocalString.book),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                )),
          ),
          Positioned(
              right: 30.w,
              top: 30.h,
              child: Obx(
                () => InkWell(
                  onTap: controller.handleFavorite,
                  child: Icon(
                    Icons.favorite,
                    color:
                        controller.isFavorite.value ? Colors.red : Colors.grey,
                    size: 25,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
