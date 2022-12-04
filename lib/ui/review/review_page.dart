// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';

import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/review/components/comment_item.dart';
import 'package:lettutor_edu_clone/ui/review/review_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class ReviewPage extends BasePage<ReviewController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          ...controller.feedBack.map((e) => Column(
                children: [
                  CommentItem(
                    image: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: e.firstInfo?.avatar ?? imgLink,
                    ),
                    message: e.content,
                    name: e.firstInfo?.name ?? '',
                    time: e.createdAt.toString(),
                    rating: e.rating.toDouble(),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
